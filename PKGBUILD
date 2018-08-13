# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-papis-python-rofi
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc="Create simple GUIs using the Rofi application (fork for papis)"
arch=('any')
url="https://pypi.org/project/papis-python-rofi/"
license=('GPL')
depends=('python')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3bd01a9db97b620c4249e89e37c2fe669ba405ac179ea3bffa43246c05af668e')
noextract=()

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
