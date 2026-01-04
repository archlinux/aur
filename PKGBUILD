# Maintainer: Luc Khai Hai <lkh42t@gmail.com>

pkgname=python-sphinx-lint
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc='Check for stylistic and formal issues in .rst and .py files included in the documentation.'
arch=('any')
url=https://github.com/sphinx-contrib/sphinx-lint
license=('PSF-2.0')
depends=('python' 'python-regex'
         # AUR
         'python-polib')
makedepends=('git' 'python-build' 'python-hatch-vcs' 'python-hatchling' 'python-installer')
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('2ae70dc292080d9242ff79ba5950bc894a85de04f0677c9410bf558515342eeffaa715fabe1c4f2f97eed61009a9aec48c64cf8000bdf316db697a3b60c3737c')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vi: sts=2 sw=2 et
