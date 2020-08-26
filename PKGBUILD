# Maintainer: Pedro H. Lara Campos <root@pedrohlc.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=chaotic-mirrorlist
pkgver=20200826
pkgrel=1
pkgdesc="Chaotic-AUR mirror list for use by pacman"
arch=('any')
url="https://lonewolf.pedrohlc.com/chaotic-aur"
license=('GPL')
backup=(etc/pacman.d/chaotic-mirrorlist)
source=(mirrorlist)

# NOTE on building this package:
# * Go to the trunk/ directory
# * Run bash -c ". PKGBUILD; updatelist"
# * Update the checksums, update pkgver
# * Build the package

updatelist() {
  rm -f mirrorlist
  curl -o mirrorlist "$url/mirrorlist"
}

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/chaotic-mirrorlist"
}

sha256sums=('dbd52de968e80756f409e88597554e44dcf45c7cf18f09deb6d40492dcb9f51f')
