pkgname=python-offshoot-git
_module='offshoot'
pkgver=r9.7906a95
pkgrel=1
pkgdesc="Modern, elegant, minimalistic but powerful plugin system for Python 3.5+."
url="https://github.com/greyltc/offshoot"
depends=(python python-yaml)
makedepends=(python-setuptools)
license=('MIT')
arch=('any')
source=("git://github.com/greyltc/offshoot.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_module"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

