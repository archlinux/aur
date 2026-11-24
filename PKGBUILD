# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=token-tracker
pkgver=0.5.9
pkgrel=1
pkgdesc="Local token usage tracker for Claude Code and Codex with a status line and cost analysis"
arch=('any')
url="https://github.com/stormzhang/token-tracker"
license=('MIT')
depends=('python' 'python-prompt_toolkit' 'python-questionary' 'python-rich' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/t/token_tracker/token_tracker-${pkgver}.tar.gz")
sha256sums=('05c07870b6dd89a9c288170b71a2d9e11d5d182ee690ef317373cbfcf64f00b8')

build() {
  cd "token_tracker-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "token_tracker-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
