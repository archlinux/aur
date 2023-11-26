# Maintainer: Luc Khai Hai <lkh42t@gmail.com>

pkgname=python-sphinx-lint
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc='Check for stylistic and formal issues in .rst and .py files included in the documentation.'
arch=('any')
url=https://github.com/sphinx-contrib/sphinx-lint
license=('PSF')
depends=('python' 'python-regex'
         # AUR
         'python-polib')
makedepends=('python-build' 'python-hatch-vcs' 'python-hatchling' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('10321f1469458f0e3bd16ca815173c1ff6d48c53ef0f0a75abf8a870133fb0f4')

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vi: sts=2 sw=2 et
