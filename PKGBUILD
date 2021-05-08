# Maintainer: AnErrupTion <anerruption@disroot.org>
pkgname=ly-plank-patched
pkgver=0.5.3
pkgrel=1
pkgdesc="TUI display manager, patched for Plank and other apps."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/SartoxOnlyGNU/ly"
license=('custom:WTFPL')
depends=('pam' 'xorg-xauth')
makedepends=('git')
conflicts=('ly' 'python-ly-git' 'ly-git')
backup=('etc/ly/config.ini')
source=('git+https://github.com/SartoxOnlyGNU/ly.git')
md5sums=('SKIP')

prepare() {
	cd ly
	make github
}

build() {
	cd ly
	make
}

package() {
	cd ly
	make DESTDIR="$pkgdir" install
	install -D -m644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
