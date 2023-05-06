# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>

pkgname=autogit
pkgver=1.8.4
pkgrel=1
pkgdesc="Auto build, update, install PKGBUILDS from Github, Gitlab and AUR via makepkg, devtools, chrootbuild"
arch=('any')
url="https://github.com/puxplaying/autogit"
license=('GPL3')
depends=('pacman' 'sudo' 'bash' 'curl' 'fzf')
makedepends=('git')
optdepends=('manjaro-chrootbuild: Needed for Manjaro clean chroot package building'
            'devtools: Needed for Arch Linux clean chroot package building')
backup=("etc/$pkgname/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('764faf07d65a9c035ecc3700fe8e50b188133146d0a44756e9192a6c96014b92')

package () {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.conf" -t "$pkgdir/etc/$pkgname/"
  cp -r reponames "$pkgdir/etc/$pkgname/"
}
