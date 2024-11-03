# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>

pkgname=autogit
pkgver=2.0.1
pkgrel=1
pkgdesc="Auto build, update, install PKGBUILDS from Github, Gitlab and AUR"
arch=('any')
url="https://github.com/puxplaying/autogit"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'curl'
  'fzf'
  'pacman'
  'rsync'
  'sudo'
)
optdepends=(
  'devtools: Needed for Arch Linux clean chroot package building'
)
backup=("etc/$pkgname/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('24da439a686050236db57ea7841be53d1905359c13a6a942079efdc9a6e4acf2')

package () {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.conf" -t "$pkgdir/etc/$pkgname/"
  cp -r reponames "$pkgdir/etc/$pkgname/"
}
