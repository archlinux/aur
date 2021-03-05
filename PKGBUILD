 # Maintainer: poncho
pkgname=kappa-launcher-git
_pkgname=kappa-launcher
pkgver=r80.387b50f
pkgrel=1
pkgdesc="Twitch launcher using rofi"
arch=('any')
url="https://github.com/jp1995/kappa-launcher"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
depends=(
  'rofi'
  'jq'
  'streamlink'
  )
optdepends=(
  'chatterino: chat client'
  'chatty-beta: alternative chat client'
  'xdg-utils: browser function'
)
makedepends=('git')
source=("git://github.com/jp1995/kappa-launcher.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$_pkgname
  install -d $pkgdir/usr/bin
  install -m755 kpl $pkgdir/usr/bin
}
