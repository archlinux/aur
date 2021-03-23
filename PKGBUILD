# Maintainer: Bruno Miguel <https://twitter.com/brunomiguel>

pkgname=userrepository-mirrorlist
pkgver=0.0.2
pkgrel=2
pkgdesc="Userrepository.eu mirror list for pacman"
arch=('any')
url="https://raw.githubusercontent.com/brunomiguel/userrepository-mirrorlist/main/"
license=('GPL3')
backup=(etc/pacman.d/userrepository-mirrorlist)
source=(mirrorlist)
install=userrepository.install

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

sha256sums=('5558c32995ca1ae359709cb63f9dafd57db64bc9ff11626b3e110c9e0d290599')

