# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='undocker'
pkgver=7
pkgrel=2
pkgdesc='Extract Docker images'
arch=('any')
url='https://github.com/larsks/undocker/'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f098bd429a5a7bf08730069388cda2c14612f69eae0af4f27367f2cb8c9e4254')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
