# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-swap
pkgver=1.2.0
pkgrel=1
pkgdesc="Switch between Claude Code accounts with rate-limit rotation and a usage dashboard"
arch=('any')
url="https://github.com/realiti4/claude-swap"
license=('MIT')
depends=('python' 'python-textual' 'python-truststore')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/c/claude_swap/claude_swap-${pkgver}.tar.gz")
sha256sums=('e338e2d3a715a58cca86a1c3f571854ee0f946e8dc1dc4b292e72afb406ccaf1')

build() {
  cd "claude_swap-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "claude_swap-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
