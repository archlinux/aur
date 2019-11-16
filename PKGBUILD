# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=ShivyC

pkgname=shivyc
pkgver=0.5.0
pkgrel=2
pkgdesc="A C compiler written in Python"
arch=('x86_64')
url="https://github.com/ShivamSarodia/ShivyC"
license=('MIT')
depends=(
  'python>=3.6'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "${url}/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '693d3be4d923f1c1d77cdae80d9ce856a3221891769f74907d8dde1ae65dcaca'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 demo.gif "${pkgdir}/usr/share/doc/${pkgname}/demo.gif"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
