# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname='xidle'
pkgver='26052015'
pkgrel='1'
pkgdesc="xidle runs a program on X inactivity"
arch=('any')
url="http://www.freshports.org/x11/${pkgname}"
license=('BSD')
depends=('libxss' 'libxext' 'libx11')
source=("Makefile"
	"http://distcache.freebsd.org/local-distfiles/novel/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('157242d569537ae00b2ddc57b3b7abdbb551b5294adfaefb7bd02f00ee6c3cc8'
            'a7ba1b887c0f4d9d080dc7f49569bf48e3df1d9f2c08b11cffd159c5a15b174c')

build() {
  pushd "${pkgname}-${pkgver}"
  make -f ../Makefile
  popd
}

package() {
  pushd "${pkgname}-${pkgver}"
  make -f ../Makefile DESTDIR="${pkgdir}" install
  popd
}
