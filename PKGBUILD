# Contributor: Justin Hale <justinhale at ganja.nl>
# Maintainer: Achilleas Pipinellis <axilleas archlinux gr>

pkgname=python2-parsley-git
pkgver=r362.c89b3f0
pkgrel=1
pkgdesc="A parser generator library based on OMeta, and other useful parsing tools."
arch=('any')
url="https://github.com/pyga/parsley"
license=('MIT')
depends=('python2')
conflicts=('python2-parsley')
makedepends=('git' 'python2-setuptools')
source=("${pkgname}::git+https://github.com/python-parsley/parsley.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python2 setup.py build
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
