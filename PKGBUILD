# Maintianer: milkii on Freenode
# Creator: archlinux.info:tdy

pkgname=konfyt-git
pkgver=r181.81b5295
pkgrel=1
pkgdesc="A digital keyboard workstation - search for SFZs/soundfonts, create layered patches on the fly, and more"
arch=(i686 x86_64)
url=https://github.com/noedigcode/konfyt
license=(GPL3)
depends=(carla)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/noedigcode/${pkgname/-/.})
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  qmake ${pkgname%-git}.pro
  make
}

package() {
  cd $pkgname
  install -Dm755 ${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
}
