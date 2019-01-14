# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=pyinstrument_cext

pkgname=python-pyinstrument_cext
pkgver=0.2.0
pkgrel=1
pkgdesc="A CPython extension supporting pyinstrument"
arch=('any')
url="https://github.com/joerick/pyinstrument_cext"
license=('BSD')
depends=('gcc' 'python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://github.com/joerick/pyinstrument_cext/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'dddf4f878c7b344a44729e4f00c0b7586f95df725a8438fc5e7dfcf05dd4989c'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
