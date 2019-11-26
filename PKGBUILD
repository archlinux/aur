# Maintainer: peippo <christoph.fink@gmail.com>
pkgbase=python-vadersentiment

pkgname=("python-vadersentiment" "python2-vadersentiment")
pkgdesc="VADER (Valence Aware Dictionary and sEntiment Reasoner)"
url="https://github.com/cjhutto/vaderSentiment"

pkgver=3.2.1
pkgrel=0

arch=("any")
license=("MIT")

makedepends=("python-setuptools" "python2-setuptools" )

source=("https://files.pythonhosted.org/packages/76/bb/ef06e55e35f01d91e1840b58035a8b129cdd3be4282095cbff4f8b6087b0/vaderSentiment-3.2.1.tar.gz")
sha512sums=("1ca9b2e3f1decf92825f456272e7466808ebd830b8c11d224ade4e16285b6b0d16167384f0fc097416b48ee7f77829db3ecf652487f68c2f97a71b275ab929cd")


prepare() {
  cd "${srcdir}"/vaderSentiment-$pkgver
}

build() {
  cp -r "${srcdir}"/vaderSentiment-$pkgver "${srcdir}"/vaderSentiment-$pkgver-py2

  cd "${srcdir}"/vaderSentiment-$pkgver
  python setup.py build

  cd "${srcdir}"/vaderSentiment-$pkgver-py2
  python2 setup.py build
}

package_python-vadersentiment() {
  cd "${srcdir}/vaderSentiment-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-vadersentiment() {
  cd "${srcdir}/vaderSentiment-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

