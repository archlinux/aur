# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-schema-git
_gitname=schema
pkgver=271.bca292f
pkgrel=1
pkgdesc="Python module to validate and convert data structures (git version)"
arch=('i686' 'x86_64')
url="https://github.com/keleshev/schema"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('python-schema=0.4.1')
conflicts=('python-schema')
options=(!emptydirs)
source=('git+https://github.com/keleshev/schema.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  python setup.py build
}

package() {
  cd $_gitname
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
