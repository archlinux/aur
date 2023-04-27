# Maintainer: Edison Ibáñez <arkhan at riseup [dot] net>
# derived from st-git aur package.

pkgname=xst
epoch=1
pkgver=0.9
pkgrel=1
pkgdesc='st fork fork with xresources support and other patches'
url='https://git.sr.ht/~arkhan/xst'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git' 'harfbuzz')
source=("git+https://git.sr.ht/~arkhan/${pkgname}")
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	make clean
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 readme.org "${pkgdir}/usr/share/doc/${pkgname}/README"
}
