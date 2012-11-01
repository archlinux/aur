# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=stikked
pkgver=0.8.4
pkgrel=1
pkgdesc="An advanced and beautiful pastebin written in PHP"
arch=('any')
url="https://github.com/claudehohl/Stikked"
license=('GPL')
depends=('php')
conflicts=('stikked-git')
options=('!strip')
install=$pkgname.install
source=("stikked-$pkgver.zip::https://github.com/claudehohl/Stikked/zipball/$pkgver")
md5sums=('40b4729d7221d58d3373bb8fe3a784b7')

package() {
  cd "$srcdir"/claudehohl-Stikked-*/htdocs
  _instdir="$pkgdir/usr/share/webapps/Stikked"
  _cfgdir="$pkgdir/etc/webapps/stikked"
  mkdir -p "$_instdir" "$_cfgdir"

  cp -ra * .htaccess "$_instdir"
  mv "$_instdir/application/config/stikked.php" "$_cfgdir"
  ln -s /etc/webapps/stikked/stikked.php "$_instdir/application/config/stikked.php"
}

# vim:set ts=2 sw=2 et:
