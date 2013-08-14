# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=yourls
pkgver=1.6
pkgrel=1
pkgdesc="your own URL shortener"
arch=('any')
url="https://github.com/YOURLS/YOURLS"
license=('GPL3')
depends=('php>=4.3' 'mysql>=4.1')
conflicts=('yourls-svn')
backup=('etc/webapps/yourls/config.php')
install=$pkgname.install
source=("https://github.com/YOURLS/YOURLS/archive/${pkgver}.tar.gz")
sha1sums=('8198f69bc7386eaa9c4753c8bc5c548d4a77e152')

package() {
  cd "$srcdir/YOURLS-$pkgver"
  mkdir -p "$pkgdir/usr/share/webapps/yourls" "$pkgdir/etc/webapps/yourls"

  cp -ra */ *.php "$pkgdir/usr/share/webapps/yourls"
  cp "sample-robots.txt" "$pkgdir/usr/share/webapps/yourls/robots.txt"
  mv "$pkgdir/usr/share/webapps/yourls/user/config-sample.php" \
     "$pkgdir/etc/webapps/yourls/config.php"
  ln -s "/etc/webapps/yourls/config.php" \
        "$pkgdir/usr/share/webapps/yourls/includes/config.php"
}

# vim:set ts=2 sw=2 et:
