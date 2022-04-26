#Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=python-cga4233de
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Library to interact with the CGA4233DE router, distributed by Vodafone Germany"
arch=(any)
license=(MIT)
url="https://github.com/Zebradil/CGA4233DE"
depends=(python3 python-requests)
makedepends=(python-setuptools python-dephell)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('02a3927ca2ef01826812826d16ccb8e92a409c226e6e1ee052f4afd632b19131b8f98b2febc5b446831f173aa3163708d973175e92418d2ea3d77f40b48a690d')

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
