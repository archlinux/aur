#Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=python-powerline-taskwarrior
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="A Powerline segment for displaying information from Taskwarrior task manager"
arch=(any)
license=(MIT)
url="https://github.com/Zebradil/powerline-taskwarrior"
depends=(python3 powerline)
makedepends=(python-setuptools python-dephell)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('c0bda3991225f67b6fd98c691fc01b671445afb6c85c8e58833008e489476dfce1b70418cd2ad4530e2a6e7093a8b16e7f72014eaf3ce9d14dc45b09e0eddc49')

prepare() {
  cd "$_name-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
  python3 setup.py build
}

package() {
  cd "$_name-$pkgver"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


# vim: set ts=2 sw=2 et:
