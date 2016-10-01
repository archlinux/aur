# Maintainer: Juan Martínez <mratmartinez at anche.no>

_gitname=with
pkgname=$_gitname-git
pkgver=r55.5f7e2d5
pkgrel=1
pkgdesc="Command prefixing for continuous workflow using a single tool."
arch=('any')
url="https://github.com/mchav/with"
license=('Apache')
makedepends=('git')
source=(git://github.com/mchav/$_gitname.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_gitname

  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" with
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"  
}
