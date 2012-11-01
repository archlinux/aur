# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=yourls
pkgver=1.5.1
pkgrel=3
pkgdesc="your own URL shortener"
arch=('any')
url="http://code.google.com/p/yourls/"
license=('GPL3')
depends=('php>=4.3' 'mysql>=4.1')
conflicts=('yourls-svn')
backup=('etc/webapps/yourls/config.php')
options=('!strip')
install=$pkgname.install
source=("http://yourls.googlecode.com/files/$pkgname-$pkgver.zip")
md5sums=('9607d8cd3e6efc594f8a3d3f4171bede')

package() {
  cd "$srcdir"
  _instdir="$pkgdir/usr/share/webapps/yourls"
  _cfgdir="$pkgdir/etc/webapps/yourls"
  mkdir -p "$_instdir" "$_cfgdir"

  cp -ra */ *.php "$_instdir"
  cp sample-robots.txt "$_instdir"/robots.txt
  mv "$_instdir/user/config-sample.php" "$_cfgdir/config.php"
  ln -s /etc/webapps/yourls/config.php "$_instdir/includes/config.php"
}

# vim:set ts=2 sw=2 et:
