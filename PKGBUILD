# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=userrepository-mirrors
pkgver=0.0.3
pkgrel=3
pkgdesc="Userrepository.eu mirror list for pacman"
arch=('any')
url="https://github.com/brunomiguel/userrepository-mirrorlist"
license=('GPL3')
backup=(etc/pacman.d/userrepository-mirrors)
source=(mirrorlist)
install=userrepository.install
sha256sums=('11d85348a61fe85e173424313d3affc39d565c3d58f7222fd7e1303be5f53a31')

updatelist() {
  rm -f mirrorlist
  curl -o mirrorlist "$url/mirrorlist"
}

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/userrepository-mirrors"
}

