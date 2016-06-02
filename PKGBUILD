# Maintainer: c6parmak <can6parmak@gmail.com>

pkgname=oof2
pkgver='2.1.12'
pkgrel=1
pkgdesc="Finite element analysis of microstructures."
arch=('i686' 'x86_64')
url="http://www.ctcms.nist.gov/oof/oof2/index.html"
license=('custom')
depends=('python2' 'pygtk' 'libgnomecanvas' 'imagemagick' 'lapack')
source=("http://www.ctcms.nist.gov/oof/oof2/source/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('e1cd0c5b2795d78071b54017f8618962'
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
