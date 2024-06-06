# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>

pkgname=autogit
pkgver=1.9.0
pkgrel=1
pkgdesc="Auto build, update, install PKGBUILDS from Github, Gitlab and AUR"
arch=('any')
url="https://github.com/puxplaying/autogit"
license=('GPL-3.0-or-later')
depends=(
  base-devel
  bash
  curl
  fzf
)
makedepends=(
  git
)
optdepends=(
  'manjaro-chrootbuild: Needed for Manjaro clean chroot package building'
  'devtools: Needed for Arch Linux clean chroot package building'
)
backup=("etc/$pkgname/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c5bd919507944703d3aa7ea75719dde43026da0a6de8fae6661c4488229ddd88')

package () {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.conf" -t "$pkgdir/etc/$pkgname/"
  cp -r reponames "$pkgdir/etc/$pkgname/"
}
