# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=hokiestalker-git
_gitname=hokiestalker
pkgver=29.98405c6
pkgrel=2
pkgdesc="Query the Virginia Tech people search service for information about a person."
url="https://github.com/mutantmonkey/hokiestalker"
arch=('any')
license=('ISC')
depends=('python' 'python-lxml')
makedepends=('git' 'python-setuptools')
provides=('hokiestalker')
conflicts=('hokiestalker')
source=('git+https://github.com/mutantmonkey/hokiestalker.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd $_gitname
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
