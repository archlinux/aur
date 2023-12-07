# Maintainer: Antonio Teixeira <antoniolrt at gmail dot com>

pkgname=ds-inhibit
_srctag=0.1.1
pkgver=${_srctag}
pkgrel=1
pkgdesc="DualShock 4/DualSense mouse inhibitor"
url="https://gitlab.com/evlaV/ds-inhibit"
arch=('any')
license=('BSD')
source=("$pkgname::git+https://gitlab.com/evlaV/ds-inhibit#tag=v${_srctag}")
sha256sums=('SKIP')
depends=('udev' 'python' 'python-pyinotify')
makedepends=('git' 'openssh')

package() {
	cd "$pkgname"
	make install DESTDIR="$pkgdir"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

