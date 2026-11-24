# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-file-recovery
pkgver=0.2.0
pkgrel=1
pkgdesc="Recover files created and modified by Claude Code from its session logs"
arch=('any')
url="https://github.com/hjtenklooster/claude-file-recovery"
license=('MIT')
depends=('python' 'python-orjson' 'python-rich' 'python-textual' 'python-typer' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/c/claude_file_recovery/claude_file_recovery-${pkgver}.tar.gz")
sha256sums=('955211bb52994c127f0a23d13ef9183aa52527f2dc19a1930e792c18a25ddfd5')

build() {
  cd "claude_file_recovery-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "claude_file_recovery-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
