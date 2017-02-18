# Maintainer: Charlie Wolf <charlie@wolf.is>

_pkgname=pass_python_keyring
pkgname=${_pkgname}-git
pkgver=r12.cbaae67
pkgrel=1
pkgdesc="A pass-powered backend for Python Keyring Lib"
url="https://github.com/notandy/pass_python_keyring"
arch=("any")
depends=('python' 'python-gnupg')
makedepends=('python-setuptools')
source=("git+https://github.com/notandy/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}/
  python setup.py build
}

package() {
  cd $srcdir/${_pkgname}/
  python setup.py install --root=${pkgdir}/ --optimize=1
}

