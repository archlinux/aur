# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Co-maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=yourls
pkgver=1.10.4
pkgrel=1
pkgdesc="your own URL shortener"
arch=('any')
url="https://github.com/YOURLS/YOURLS"
license=('MIT')
depends=('php>=7.4')
optdepends=('mysql>=5.0')
conflicts=('yourls-svn')
backup=('etc/webapps/yourls/config.php')
install=$pkgname.install
source=("yourls-${pkgver}.tar.gz::https://github.com/YOURLS/YOURLS/archive/${pkgver}.tar.gz")
sha512sums=('9f7365f5d7e9a93a9e9de7a6fe2a7429797572ea52d3408556a53025e0f8745df2f10321caa2e7743f3dc988ee5dc1dd9589fd736b44226f2d25ea46b159ae1c')

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
