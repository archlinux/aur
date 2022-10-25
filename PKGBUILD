# Maintainer: Luc Khai Hai <lkh42t@gmail.com>

pkgname=python-sphinx-lint
_name=${pkgname#python-}
pkgver=0.6.7
pkgrel=1
pkgdesc='Check for stylistic and formal issues in .rst and .py files included in the documentation.'
arch=('any')
url=https://github.com/sphinx-contrib/sphinx-lint
license=('PSF')
depends=('python' 'python-regex' 
         # AUR
         'python-polib')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('704a9bffd9117c77accf4a3c46f8ab3b4cb6ef51419b5d21a4386042f0616789')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vi: sts=2 sw=2 et
