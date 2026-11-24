# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=artui
pkgver=1.1.2
pkgrel=1
pkgdesc="Read and track recent arXiv papers in a TUI"
arch=('any')
url="https://github.com/fjonasalice/artui"
license=('MIT')
depends=('python' 'python-arxiv' 'python-pygments' 'python-pyinspirehep' 'python-pyperclip' 'python-requests' 'python-textual' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/artui/artui-${pkgver}.tar.gz")
sha256sums=('15e1de8d97477b2e7a418e0cb249fd177527b56342ebdf3ec8872da80a6982f7')

build() {
  cd "artui-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "artui-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
