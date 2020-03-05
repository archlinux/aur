# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgbase=python2-langdetect
_name=langdetect
pkgname=('python2-langdetect')
pkgver=1.0.8
pkgrel=1
pkgdesc="Language detection library ported from Google's language-detection"
arch=('any')
url="https://github.com/Mimino666/langdetect"
license=('Apache')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('beade4e33abd25364ead64c30b3631615526effa7788c50e0b2bfac454e7b69a33742780f838ddf5df5292dadf0449ea8f3a4197214d84a164cbecee76020a4d')

build() {
  cd "${_name}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  python2 setup.py test
}

package_python2-langdetect() {
  depends=('python2-six')
  cd "${_name}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
