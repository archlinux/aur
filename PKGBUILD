# Maintainer: Bruno Miguel <bruno@userrepository.eu>

pkgname=userrepository-mirrorlist
pkgver=0.0.3
pkgrel=1
pkgdesc="Userrepository.eu mirror list for pacman"
arch=('any')
url="https://github.com/brunomiguel/userrepository-mirrorlist"
license=('GPL3')
backup=(etc/pacman.d/userrepository-mirrorlist)
source=(mirrorlist)
install=userrepository.install
sha256sums=('11d85348a61fe85e173424313d3affc39d565c3d58f7222fd7e1303be5f53a31')

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
  install -m644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/userrepository-mirrorlist"
}

