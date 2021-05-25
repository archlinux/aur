# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=nspawn-git
pkgver=r21.989bda5
pkgrel=1
pkgdesc="A wrapper around machinectl for easy-deployment of nspawn.org containers"
arch=('any')
url="https://github.com/nspawn/nspawn"
license=('GPL3')
depends=('systemd')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m 755 nspawn "$pkgdir/usr/bin/nspawn"
	install -D -m 755 nspawn-builder "$pkgdir/usr/bin/nspawn-builder"
}
