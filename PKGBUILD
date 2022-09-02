# Maintainer: NAHO <90870942+trueNAHO@users.noreply.github.com>

pkgname=grub-theme-vimix-very-dark-blue
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple very dark blue GRUB theme"
arch=(any)
url="https://github.com/trueNAHO/grub2-theme-vimix-very-dark-blue"
license=(GPL3)
depends=(bash grub sudo)
makedepends=(git)
optdepends=(
    'efibootmgr: Linux user-space application to modify the EFI Boot Manager' \
    'grub-customizer: GUI tool to configure GRUB' \
    'os-prober: Utility to detect other OSes on a set of drives'
)
install="$pkgname.install"
source=("$pkgname::git+$url")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname" || return
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

package() {
  declare -r _pkgdir="$pkgdir/usr/share/grub/themes/$pkgname"

  install -dm 755 "$_pkgdir"
  cp -r --no-preserve=ownership "$srcdir/$pkgname/src/." "$_pkgdir"
}
