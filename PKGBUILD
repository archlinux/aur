pkgname=python-gitpersona
pkgver=0.1.2
pkgrel=1
pkgdesc="Developer persona and analytics toolkit for GitHub profiles"
arch=(any)
url="https://github.com/rdarshan927/GitPersona"
license=('custom')
depends=(python-requests python)
makedepends=(python-setuptools python-wheel)
source=("https://github.com/rdarshan927/GitPersona/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69835575ad43982bc934ecaae0823d7b2744d7bfb13b820b9b0987f8586f5370')

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