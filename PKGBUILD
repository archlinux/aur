# Contributor: Justin Hale <justinhale at ganja.nl>
# Maintainer: Achilleas Pipinellis <axilleas archlinux gr>

pkgname=python2-txsocksx-git
pkgver=r97.110f71d
pkgrel=1
pkgdesc="SOCKS{4,4a,5} endpoints for twisted"
arch=('any')
url="https://github.com/habnabit/txsocksx"
license=('MIT')
depends=('python2' 'python2-twisted' 'python2-pyopenssl' 'python2-parsley-git')
conflicts=('python2-txsocksx')
makedepends=('git' 'python2-setuptools')
source=("${pkgname}::git://github.com/habnabit/txsocksx.git")
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
