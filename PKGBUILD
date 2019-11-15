# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python2-pmw
pkgver=2.0.1
pkgrel=1
pkgdesc="A toolkit for high-level compound widgets in Python using the Tkinter module"
arch=('any')
url="http://pmw.sourceforge.net/"
license=('MIT')
depends=('python2' 'tk')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/Pmw/Pmw-${pkgver}.tar.gz")
md5sums=('8080b0fabc731ff236f97e88e13b3938')

prepare() {
  cd "${srcdir}/Pmw-${pkgver}"

  find . -name '*.py' -exec \
    sed -i "s|python|python2|g" {} \;
}

build() {
  cd "${srcdir}/Pmw-${pkgver}"

  python2 setup.py build
}

package() {
  cd "${srcdir}/Pmw-${pkgver}"

  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
