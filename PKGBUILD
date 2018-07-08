# Maintainer: Tim Wanders <timwanders241@gmail.com>
_pkgname="doom-launcher"
pkgname="${_pkgname}-git"
pkgver=1
pkgrel=1
pkgdesc="doom-launcher: A doom mod manager and launcher"
arch=('any')
url="https://gitlab.com/tim241/${_pkgname}"
license=('GPL3')

provides=('doom-launcher')
conflicts=('doom-launcher')
depends=('bash' 'dialog' 'gzdoom')

source=("git+https://gitlab.com/tim241/${_pkgname}.git")

sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --always | sed -e 's|-|.|g'
}

package() {
	cd "$_pkgname"
	install -D -m=0755 doom-launcher "$pkgdir/usr/bin/doom-launcher"
}
