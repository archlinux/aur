# Maintainer: NAHO <90870942+trueNAHO@users.noreply.github.com>

_pkgname=grub2-theme-vimix-very-dark-blue
pkgname=grub-theme-vimix-very-dark-blue
pkgver=1.0.0.r90.4f0a5fc
pkgrel=1
pkgdesc="Simple very dark blue GRUB theme"
arch=(any)
url="https://github.com/trueNAHO/$_pkgname"
license=(GPL3)
depends=(bash grep grub sudo)
makedepends=(git)
optdepends=(
    'efibootmgr: Linux user-space application to modify the EFI Boot Manager'
    'grub-customizer: GUI tool to configure GRUB'
    'os-prober: Utility to detect other OSes on a set of drives'
)
install="$pkgname.install"
source=("git+$url")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname" || return
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

package() {
  declare -r _pkgdir="$pkgdir/usr/share/grub/themes/$pkgname"

  install -dm 755 "$_pkgdir"
  cp -r --no-preserve=ownership "$srcdir/$_pkgname/src/." "$_pkgdir"
}
