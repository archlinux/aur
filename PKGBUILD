# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='python-aia-chaser'
_pkgname=aia_chaser
pkgver=3.3.0
pkgrel=1
pkgdesc="Chase authority information access from a host certificate to complete the chain of trust."
url="https://pypi.org/project/aia-chaser/"
license=('MIT')
arch=('any')
depends=(
python
python-cryptography
)
makedepends=(
python-build
python-installer
python-poetry
)

source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('9b5bfee8b03d3cd08d5af654c9de994ad14d306698b6d621a871b533dac165f2')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

