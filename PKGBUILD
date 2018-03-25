# Maintainer:

pkgname=nikki-levels-git
pkgver=r4.e654797
pkgrel=1
pkgdesc="Community levels for Nikki and the Robots"
arch=('any')
url="https://github.com/nikki-and-the-robots"
license=('CCPL')
depends=('nikki')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/nikki-and-the-robots/nikki-levels.git')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  rm community-levels/community-levels-2012-09-23.zip
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/opt/nikki/data/standardLevels
  cp -r community-levels "$pkgdir"/opt/nikki/data/standardLevels
}
