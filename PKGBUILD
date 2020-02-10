 # Maintainer: poncho
pkgname=kappa-launcher
pkgver=r35.8e6c834
pkgrel=1
pkgdesc="Twitch launcher using rofi"
arch=('any')
url="https://github.com/jp1995/kappa-launcher"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
  'rofi'
  'jq'
  'streamlink'
  )
optdepends=(
  'chatterino: chat client'
  'chatty: alternative chat client'
  'xdg-utils: browser function'
)
makedepends=('git')
source=("git://github.com/jp1995/kappa-launcher.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$pkgname
  install -d $pkgdir/usr/bin
  install -m755 kpl $pkgdir/usr/bin
}
