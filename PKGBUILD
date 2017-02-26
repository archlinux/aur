# Maintainer: j605

_gitname=collision
pkgname=$_gitname-git
pkgver=r77.7940772
pkgrel=1
pkgdesc="Collision window navigation module for AwesomeWM"
arch=('any')
url="https://github.com/Elv13/collision"
license=('unknown')
depends=('awesome')
makedepends=('git')
provides=('collision')
source=("git+https://github.com/Elv13/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"

  install -dm 755 -- "${pkgdir}/usr/share/awesome/lib/${_gitname}/"
  cp * "${pkgdir}/usr/share/awesome/lib/${_gitname}/"
}
