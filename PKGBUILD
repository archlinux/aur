# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-vondb
_name=${pkgname#python-}
pkgver=3.6.1
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
sha256sums=('4db98612779d832c91afb85be4ae4526939c0d72b2a58d689a2e981ccb38b1e3')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
