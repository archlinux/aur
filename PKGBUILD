# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Co-maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=yourls
pkgver=1.9.1
pkgrel=1
pkgdesc="your own URL shortener"
arch=('any')
url="https://github.com/YOURLS/YOURLS"
license=('GPL3')
depends=('php>=7.4')
optdepends=('mysql>=5.0')
conflicts=('yourls-svn')
backup=('etc/webapps/yourls/config.php')
install=$pkgname.install
source=("yourls-${pkgver}.tar.gz::https://github.com/YOURLS/YOURLS/archive/${pkgver}.tar.gz")
sha512sums=('58cc703799709ac2a57384152329e6b3fab35ade3127f8bbe547f192b2d1c3ee6dd6dd53352b3ab1ff575d40adde472bb2d7cd8539dde738d7c44c05c54827f3')

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
