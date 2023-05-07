# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-aesedb
_pkgname=aesedb
pkgver=0.1.3
pkgrel=1
pkgdesc="Asynchronous parser for JET."
url="https://github.com/skelsec/aesedb"
arch=('any')
license=('MIT')
depends=('python' 'python-unicrypto' 'python-aiowinreg' 'python-tqdm' 'python-colorama' 'python-pycryptodomex')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("https://github.com/skelsec/${_pkgname}/archive/refs/tags/${pkgver}.zip")
sha256sums=('6555bee274a3e992a472be607281a57fea97cbae94392e24a64477f586483d76')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
