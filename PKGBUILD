# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mini-swe-agent
pkgver=2.4.6
pkgrel=1
pkgdesc="Minimal AI agent that solves GitHub issues and helps in the command line"
arch=('any')
url="https://github.com/SWE-agent/mini-swe-agent"
license=('MIT')
depends=('litellm' 'python' 'python-datasets' 'python-dotenv' 'python-jinja' 'python-openai' 'python-platformdirs' 'python-prompt_toolkit' 'python-pydantic' 'python-requests' 'python-rich' 'python-tenacity' 'python-textual' 'python-typer' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/m/mini_swe_agent/mini_swe_agent-${pkgver}.tar.gz")
sha256sums=('0532c8193a763409fa52bb2b5a5d7ac9052dcb1c2cae43945b14b1b7f6ba869a')

build() {
  cd "mini_swe_agent-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "mini_swe_agent-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
