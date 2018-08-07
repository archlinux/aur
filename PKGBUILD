# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=python2-modulemd
pkgver=1.3.3
pkgrel=1
pkgdesc="A python library for manipulation of the proposed module metadata format."
arch=("any")
license=("MIT")
url="http://modulemd.readthedocs.io/en/latest/"
depends=("python2")
source=("https://files.pythonhosted.org/packages/7c/e3/b066246183455e8437774bb4408ef3f61f23adfca52efab6285160299378/modulemd-1.3.3.tar.gz")
sha256sums=('661a196187d8f69fdee04835ca3a7faae60b7fea9a5c61c8b142c19b6444f08b')

build() {
  cd "${srcdir}/${pkgname#python2-}-${pkgver}"
  python2 ./setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python2-}-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
