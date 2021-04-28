# Maintainer: Michał Lisowski <lisu@riseup.net>
pkgname=pyp2rpm
pkgver=3.3.6
pkgrel=1
pkgdesc="Convert Python packages to RPM SPECFILES"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-wheel')
depends=('python-jinja')
url="https://pypi.python.org/pypi/pyp2rpm"
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('45ed9304d2add00e6e2f94986d8c6ded31efd6461dda65778cb03e2097f1c90c')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

