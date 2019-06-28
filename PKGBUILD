# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=smart-wallpaper-git
pkgbase=smart-wallpaper
pkgver=0
pkgrel=1
pkgdesc='Simple script to set a different wallpaper when its daytime/nightime.'
url='https://github.com/Baitinq/smart-wallpaper.git'
arch=('any')
license=('GPL')
depends=('bash' 'redshift' 'feh')
optdepends=('geolocate')
makedepends=('git')
provides=('smart-wallpaper')

source=("git://github.com/$author/$pkgbase.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbase"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgbase"

  # Install the program.
  mkdir -p "$pkgdir/usr/share/$pkgbase"
  install -Dm755 smart-wallpaper "${pkgdir}/usr/bin/$pkgbase"
  chmod +x "$pkgdir/usr/bin/$pkgbase"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgbase"
  chmod -R 777 "$pkgdir/usr/share/$pkgbase"

}
