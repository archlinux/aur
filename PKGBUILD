# Maintainer: Can Altıparmak (gulaghad) <can6parmak <AT> gmail <DOT> com>

pkgname=oof2
pkgver='2.1.11'
pkgrel=2
pkgdesc="Finite element analysis of microstructures."
arch=('i686' 'x86_64')
url="http://www.ctcms.nist.gov/oof/oof2/index.html"
license=('custom')
depends=('python2' 'pygtk' 'libgnomecanvas' 'imagemagick' 'lapack')
source=("http://www.ctcms.nist.gov/oof/oof2/source/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('a1061fc08dbed4a2c15d2c569849f858'
         'c1d808bd883c2e0a30b687e3fcec4847')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -m 644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
