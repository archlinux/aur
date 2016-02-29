# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=paperwork
pkgver=0.3.1.1
pkgrel=1
pkgdesc='A tool to make papers searchable - scan & forget'
arch=('any')
url='https://github.com/jflesch/paperwork'
license=('GPL3')
depends=('pygobject2-devel' 'pygtk' 'python2-pycountry'
         'python2-poppler' 'python2-pyinsane-git' 'python2-pyocr'
         'python2-levenshtein' 'python2-whoosh' 'python2-pyenchant'
         'python2-joblib' 'python2-numpy' 'python2-scipy' 'python2-scikit-learn'
         'python2-scikit-image' 'python2-gobject' 'python2-nltk'
         'python2-termcolor' 'python2-simplebayes' 'glade')
makedepends=('python2' 'python2-setuptools')
optdeps=('cuneiform: alternativer OCR')
source=("https://github.com/jflesch/paperwork/archive/${pkgver}.zip")
md5sums=('c0594793b68841954ae70604c1a6c3d7')
install=paperwork.install

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
