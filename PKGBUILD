# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=python-google_trans_new
pkgver=1.1.9
pkgrel=1
pkgdesc="A free and unlimited python API for google translate"
arch=('any')
url="https://github.com/lushan88a/google_trans_new"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/google_trans_new/google_trans_new-${pkgver}.tar.gz")
sha256sums=('9f6643420334cc1b94ebd84e03774736e76c0564208efb1bc9c5019b9820e19b')

build() {
  cd "${srcdir}/google_trans_new-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/google_trans_new-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  # License is embedded in readme
  install -Dm644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
