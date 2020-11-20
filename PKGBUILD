# Maintainer: Michał Lisowski <lisu@riseup.net>
pkgname=pyp2rpm
pkgver=3.3.5
pkgrel=1
pkgdesc="Convert Python packages to RPM SPECFILES"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-wheel')
depends=('python-jinja')
url="https://pypi.python.org/pypi/pyp2rpm"
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e5812c3dafe5a143f29d3896d9b2e93077c703d1f00f00aa72445f99f886fe85')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

