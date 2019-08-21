# Maintainer: Nathan Isom <Nahanisom27 at gmail [dot] com >
# Maintainer: Edison Ibáñez <arkhan at disroot [dot] org >
# derived from xst-git aur package.

pkgname=xst
pkgver=0.7.2
pkgrel=2
pkgdesc='st fork fork with xresources support and other patches'
url='https://github.com/neeasade/xst'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=("https://github.com/gnotclub/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('1b1fd5edec1846bee099b40b1c09bbf0')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
