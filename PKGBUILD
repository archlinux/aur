# Maintainer: 2ion <dev@2ion.de>
pkgname=bunsen-images
pkgver=1.0
pkgrel=2
pkgdesc="BunsenLabs wallpaper collection"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-images"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/2ion/bunsen-images/archive/${pkgver}.tar.gz")
md5sums=('bd6cad0231116c0f6cfdbfd4ad6f20b2')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  local _installdir="$pkgdir/usr/share/wallpapers/bunsen"
  local _docsdir="$pkgdir/usr/share/doc/$pkgname"

  install -dm755 "$_installdir" "$_docsdir"

  cp -r bl-default  "$_installdir/default"
  cp -r bl-grub     "$_installdir/grub"
  cp -r bl-login    "$_installdir/login"
  cp -r icon-avatar "$_installdir/icon-avatar"
  cp -r svg         "$_installdir/svg"
  cp -r wallpapers  "$_installdir/wallpapers"

  install -m644 -t "$_docsdir" LICENSE README
  install -m644 -t "$_docsdir" debian/changelog debian/copyright
}
