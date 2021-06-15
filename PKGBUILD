# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=pyDataverse
pkgname=python-pydataverse
pkgver=0.3.1
pkgrel=1
pkgdesc="a Python module for Dataverse."
arch=('any')
url="https://github.com/gdcc/pyDataverse"
license=('MIT')
depends=('python' 'python-requests>=2.12.0' 'python-jsonschema>=3.2.0' 'curl')
makedepends=('python-setuptools')
source=("https://github.com/gdcc/pyDataverse/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fcdbac27a91debb831c4a6ed3bd7fd77653db4bd562ca9d350d3a825a2048679')

package() {
  cd "$srcdir"
  cd "${_name}-${pkgver}"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m setuptools.launch setup.py install --root="$pkgdir"/ --optimize=1
}
