# Contributor: Justin Hale <justinhale at ganja.nl>
# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
pkgname=python2-txsocksx-git
pkgver=r87.1fb0462
pkgrel=1
pkgdesc="SOCKS{4,4a,5} endpoints for twisted"
arch=('any')
url="https://github.com/habnabit/txsocksx"
license=('MIT')
depends=('python2' 'twisted' 'python2-pyopenssl' 'python2-parsley-git')
conflicts=('python2-txsocksx')
makedepends=('git' 'python2-setuptools')
source=("${pkgname}::git://github.com/habnabit/txsocksx.git")
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
