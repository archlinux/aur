pkgname=canary-layout-git
pkgver=35.1c694b0
pkgrel=1
pkgdesc="The Canary keyboard layout"
url="https://github.com/Apsu/Canary"
arch=("any")
license=("MIT")
source=("git+https://github.com/Apsu/Canary.git" "changename.patch")
sha512sums=(
  SKIP
  0fda69e442c94c11f743f0299ea57d2f17d2c487e9e673283cce34fd34654a5790cf76bdb20537a444d00566e7260a8c68b999d890bf49108d5e1149108eb411
)

pkgver() {
  cd Canary
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd Canary
  patch "canary" "$srcdir/changename.patch"
}

package() {
  cd Canary
  install -Dm644 canary "$pkgdir/usr/share/X11/xkb/symbols/canary"
}
