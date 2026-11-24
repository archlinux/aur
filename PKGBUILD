# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=exosphere
pkgver=3.0.4
pkgrel=1
pkgdesc="Patch reporting for remote Unix systems with a CLI and TUI"
arch=('any')
url="https://github.com/mrdaemon/exosphere"
license=('MIT')
depends=('fabric' 'python' 'python-cyclopts' 'python-filelock' 'python-invoke' 'python-jinja' 'python-packaging' 'python-paramiko' 'python-platformdirs' 'python-prompt_toolkit' 'python-pydantic' 'python-rich' 'python-textual' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/e/exosphere_cli/exosphere_cli-${pkgver}.tar.gz")
sha256sums=('a7ae8d0748d85f614757176d5ac4a1ec052dd343fa9fd6f0fc23ce6d1895b0dd')

build() {
  cd "exosphere_cli-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "exosphere_cli-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
