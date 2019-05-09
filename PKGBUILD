# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=stikked
pkgver=0.13.0
pkgrel=1
pkgdesc="An advanced and beautiful pastebin written in PHP"
arch=('any')
url="https://github.com/claudehohl/Stikked"
license=('GPL')
depends=('php')
conflicts=('stikked-git')
backup=('etc/webapps/stikked/stikked.php')
install=$pkgname.install
source=("stikked-$pkgver.zip::https://github.com/claudehohl/Stikked/zipball/$pkgver")
sha1sums=('8e577d097071ee2384a6f16671423c8dc2038b49')

package() {
  cd "$srcdir"/claudehohl-Stikked-*/htdocs

  mkdir -p "$pkgdir/usr/share/webapps/Stikked" "$pkgdir/etc/webapps/stikked"
  cp -ra * .htaccess "$pkgdir/usr/share/webapps/Stikked"
  mv "$pkgdir/usr/share/webapps/Stikked/application/config/stikked.php.dist" \
     "$pkgdir/etc/webapps/stikked/stikked.php"
  ln -s "/etc/webapps/stikked/stikked.php" \
        "$pkgdir/usr/share/webapps/Stikked/application/config/stikked.php"
}

# vim:set ts=2 sw=2 ft=sh et:
