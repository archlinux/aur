# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Co-maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=yourls
pkgver=1.8
pkgrel=1
pkgdesc="your own URL shortener"
arch=('any')
url="https://github.com/YOURLS/YOURLS"
license=('GPL3')
depends=('php>=7.2' 'mysql>=5.0')
conflicts=('yourls-svn')
backup=('etc/webapps/yourls/config.php')
install=$pkgname.install
source=("yourls-${pkgver}.tar.gz::https://github.com/YOURLS/YOURLS/archive/${pkgver}.tar.gz")
sha512sums=('f64092ff8a1dc3a677496485ac65494afe6d873aaa4fea0bfae5251d574d0de352a7e966cb3fad90119b3fb2cda9e10c8c966aca12bce1292f317bc038a55b6a')

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
