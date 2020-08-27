# Maintainer: Nathan Isom <Nahanisom27 at gmail [dot] com >
# Maintainer: Edison Ibáñez <arkhan at disroot [dot] org >
# derived from xst-git aur package.

pkgname=xst
pkgver=0.8.4
pkgrel=2
pkgdesc='`xst` is a st fork with some patches applied and other goodies.'
url='https://github.com/gnotclub/xst'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=("https://github.com/gnotclub/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('6757baf9f9fb62db29babc0f7d2b6493')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
