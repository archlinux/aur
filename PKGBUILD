pkgname=python-gitpersona
pkgver=0.1.0
pkgrel=1
pkgdesc="Developer persona and analytics toolkit for GitHub profiles"
arch=(any)
url="https://github.com/rdarshan927/GitPersona"
license=('custom')
depends=(python-requests python)
makedepends=(python-setuptools python-wheel)
source=("https://github.com/rdarshan927/GitPersona/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('697b95de593c7d81e148a54f0dbce2269f367103e80e9d3a5b7baf1091c2c0e1')

prepare() {
  return 0
}

build() {
  cd "${srcdir}/GitPersona-${pkgver}"
  python -m pip wheel . -w dist --no-deps
}

package() {
  cd "${srcdir}/GitPersona-${pkgver}"
  python -m pip install --root="${pkgdir}" --no-deps .
}

# Notes:
# - Replace `url` and `source` with your repository URL if different.
# - Replace `sha256sums` with the tarball checksum (or use 'SKIP' during testing).