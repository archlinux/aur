pkgname=python-gitpersona
pkgver=0.1.1
pkgrel=1
pkgdesc="Developer persona and analytics toolkit for GitHub profiles"
arch=(any)
url="https://github.com/rdarshan927/GitPersona"
license=('custom')
depends=(python-requests python)
makedepends=(python-setuptools python-wheel)
source=("https://github.com/rdarshan927/GitPersona/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df3ffa70fe22bf28a1a8b5e922d94b5bf457ea07ebc9431b8f74592e1440e6c2')

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