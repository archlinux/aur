# Maintainer: Michał Lisowski <lisu@riseup.net>
pkgname=pyp2rpm
pkgver=3.3.4
pkgrel=1
pkgdesc="Convert Python packages to RPM SPECFILES"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-wheel')
depends=('python-jinja')
url="https://pypi.python.org/pypi/pyp2rpm"
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fd8ee48658dc954a4b2c0fe3dee02a755988d22c0e0d4df89fb746b20407a833')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

