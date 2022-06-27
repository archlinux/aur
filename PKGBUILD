# Maintainer: Michał Lisowski <lisu@riseup.net>
pkgname=pyp2rpm
pkgver=3.3.8
pkgrel=1
pkgdesc="Convert Python packages to RPM SPECFILES"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-wheel')
depends=('python-jinja')
url="https://pypi.python.org/pypi/pyp2rpm"
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a2f7de5ab1ec2c26e0806ff074f7bb4205c0b4a64df2316115be95cc606efe1b')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

