# Maintainer: j605

_gitname=collision
pkgname=awesome-$_gitname-git
pkgver=r94.f51bb54
pkgrel=1
pkgdesc="Collision window navigation module for AwesomeWM"
arch=('any')
url="https://github.com/Elv13/collision"
license=('unknown')
depends=('awesome')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('collision-git')
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
