# Maintainer: Michael Straube <michael_straube web de>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=grub2-theme-breeze-git
pkgver=r17.9610d5b
pkgrel=2
pkgdesc="A minimalistic GRUB theme inspired by Breeze"
arch=('any')
url="https://github.com/gustawho/grub2-theme-breeze"
license=('CCPL:by-sa')
depends=('grub')
conflicts=('breeze-grub')
source=("git+https://github.com/gustawho/grub2-theme-breeze.git")
sha1sums=('SKIP')

pkgver(){
  cd grub2-theme-breeze

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd grub2-theme-breeze

  install -d -m 755 "$pkgdir/boot/grub/themes"
  cp -r breeze "$pkgdir/boot/grub/themes/"
}
