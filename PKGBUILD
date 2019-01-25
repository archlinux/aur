# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=binary

pkgname=python-binary
pkgver=1.0.0
pkgrel=1
pkgdesc="Easily convert between binary and SI units (kibibyte, kilobyte, etc.)."
arch=('any')
url="https://github.com/ofek/binary"
license=('MIT' 'APACHE')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/7a/09/403408a5908f0af33f454c3f825c9cbb85ce7c1648594e81925de1d9e0d5/binary-${pkgver}.tar.gz"
)
sha256sums=(
  '6ec010e58f7331ebc8bc9638dbe6c66d635de60d5818b0723bef4dead0ec28a6'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
