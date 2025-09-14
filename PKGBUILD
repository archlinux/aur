# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>

pkgname=autogit
pkgver=2.1.0
pkgrel=2
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
sha256sums=('ef404014ed3a3c0c7fe487de9739bcba59bd8c783021f60f9dfbd8188ed61a7c')

package () {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.conf" -t "$pkgdir/etc/$pkgname/"
  cp -r reponames "$pkgdir/etc/$pkgname/"
}
