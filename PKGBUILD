# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>

pkgname=catppuccin-grub-theme-git
pkgver=r24.3f62cd4
pkgrel=3
pkgdesc="Soothing pastel theme for GRUB2."
arch=("any")
url="https://github.com/catppuccin/grub"
license=("MIT")
makedepends=("git")
source=("$pkgname::git+https://github.com/catppuccin/grub.git")
sha256sums=("SKIP")
install="$pkgname.install"

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname

  install -dm755 "$pkgdir/usr/share/grub/themes/${pkgname%-grub-theme-git}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  cp -r --no-preserve=ownership ${pkgname%-git}/* "$pkgdir/usr/share/grub/themes/${pkgname%-grub-theme-git}"
}
