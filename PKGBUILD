# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-vondb
_name=${pkgname#python-}
pkgver=3.3.0
pkgrel=1
pkgdesc="VON: vEnhance's Olympiad Navigator"
arch=(any)
url=https://github.com/vEnhance/von
license=(MPL-2.0)
depends=(python python-pyperclip python-yaml)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=(
  'fzf: for fuzzy finding'
  'texlive-latex: for LaTeX support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bf3381ac3fcbbb50964af84e946095b8dbc9b2ae49ddeee5a842aa66a9e52c3b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
