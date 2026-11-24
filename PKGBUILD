# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=advai-cli
pkgver=1.0.12
pkgrel=1
pkgdesc="Local-first CLI for agent skills, browser automation and knowledge bases"
arch=('any')
url="https://github.com/advai-x/advai-cli"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/advai_cli/advai_cli-${pkgver}.tar.gz")
sha256sums=('d3e9921e3a878df3f604a85fc62901b9aebbcfbff36beafe2b50f18ea6a7617c')

build() {
  cd "advai_cli-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "advai_cli-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
