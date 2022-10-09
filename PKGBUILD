# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=python-mkdocs-section-index
_name=mkdocs-section-index
pkgver=0.3.4
pkgrel=1
pkgdesc="MkDocs plugin to allow clickable sections that lead to an index page"
arch=('any')
url="https://github.com/oprypin/mkdocs-section-index"
license=('MIT')
depends=('python' 'mkdocs' 'python-dataclasses')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-poetry')
optdepends=()
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('050151bfe7c0e374f197335e0ecb19c45b53dbafc0f817aa203f0cc24bcf7d10')


build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
