# Maintainer: Tim Wanders <timwanders241@gmail.com>
_pkgname=wifikill-linux
pkgname=wifikill-linux-git
pkgver=1
pkgrel=1
pkgdesc="wifikill-linux: A simple wifikill script for linux"
arch=('any')
url="https://gitlab.com/tim241/${_pkgname}"
license=('NONE')

provides=('wifikill-linux')
conflicts=('wifikill-linux')

depends=('bash' 'dsniff' 'net-tools' 'nmap' 'gawk')

source=("git+https://gitlab.com/tim241/${_pkgname}.git")

sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --always | sed -e 's|-|.|g'
}

package() {
	cd "$_pkgname"
   	install -D -m=755 wifikill "$pkgdir/usr/bin/wifikill"
}
