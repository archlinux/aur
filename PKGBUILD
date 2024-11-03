# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>

pkgname=autogit
pkgver=2.0.0
pkgrel=1
pkgdesc="Auto build, update, install PKGBUILDS from Github, Gitlab and AUR"
arch=('any')
url="https://github.com/puxplaying/autogit"
license=('GPL-3.0-or-later')
depends=(
  bash
  curl
  fzf
  pacman
  rsync
  sudo
)
makedepends=(
  git
)
optdepends=(
  'devtools: Needed for Arch Linux clean chroot package building'
)
backup=("etc/$pkgname/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0629193651d14f7bc60fbb8dccf3b26903b5d5f829434e2c58fa0a81ee7de414')

package () {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.conf" -t "$pkgdir/etc/$pkgname/"
  cp -r reponames "$pkgdir/etc/$pkgname/"
}
