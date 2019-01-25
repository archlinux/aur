# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=tinyrecord

pkgname=python-tinyrecord
pkgver=0.1.5
pkgrel=1
pkgdesc="Atomic transactions for TinyDB"
arch=('any')
url="https://github.com/eugene-eeo/tinyrecord"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://github.com/eugene-eeo/tinyrecord/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '2875aa34620cf7bfa2c0ba5e8d0c7d92c29efac177f30c6910d017111f505731'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
