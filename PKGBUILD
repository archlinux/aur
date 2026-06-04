# Maintainer: Xuepoo <xuepoo@users.noreply.github.com>
pkgname=waywarp-scanner
pkgver=0.2.0
pkgrel=1
pkgdesc="High-performance Wayland GUI layout scanner for AI Agents"
arch=('any')
url="https://github.com/Xuepoo/waywarp-scanner"
license=('MIT')
depends=('python' 'python-click' 'python-pytorch')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "waywarp-scanner-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "waywarp-scanner-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
