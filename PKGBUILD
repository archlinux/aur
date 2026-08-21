# Maintainer: Admin12121
pkgname=decompile
pkgver=0.9.10
pkgrel=2
pkgdesc='Docker-isolated static reverse engineering orchestrator'
arch=('any')
url='https://github.com/Admin12121/decompile'
license=('MIT')
depends=('python' 'docker')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('github-cli: passes GitHub authentication for optional AI enhancement')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 README.md "${pkgdir}/usr/share/doc/decompile/README.md"
}
