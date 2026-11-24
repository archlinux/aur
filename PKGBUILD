# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vllmops
pkgver=0.5.0
pkgrel=1
pkgdesc="Manage self-hosted vLLM models and profiles with YAML and a TUI"
arch=('any')
url="https://github.com/freim32/vllmops"
license=('Apache-2.0')
depends=('python' 'python-pydantic' 'python-rich' 'python-textual' 'python-typer' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/v/vllmops/vllmops-${pkgver}.tar.gz")
sha256sums=('bc8ec363a1cba442b8efa39b35ce53d3a3a4de3e95e8e0fd6626efcffa4e68a2')

build() {
  cd "vllmops-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "vllmops-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
