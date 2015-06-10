# Contributor: Justin Hale <justinhale at ganja.nl>
# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
pkgname=python2-parsley-git
pkgver=r357.d83692a
pkgrel=1
pkgdesc="A parser generator library based on OMeta, and other useful parsing tools."
arch=('any')
url="https://github.com/python-parsley/parsley"
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

package() {
  cd "$pkgname"
  python2 setup.py install --root=$pkgdir -O1
}

# vim:set ts=2 sw=2 et:
