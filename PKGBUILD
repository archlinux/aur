# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: François Lebigre <francois.lebigre@gmail.com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=cduce
pkgver=0.6.0
pkgrel=1
pkgdesc='XML-oriented functional language'
url='http://www.cduce.org/'
arch=('x86_64' 'i686')
license=('MIT')
depends=('ocaml' 'ocaml-findlib' 'ulex' 'ocaml-pcre' 'ocamlnet')
source=("http://www.cduce.org/download/$pkgname-$pkgver.tar.gz")
sha256sums=('28291cceaa219782f0f4cd4c9634a25bc4238e09bdb0e193b8b207ed7eb650bc')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/man" DOCDIR="$pkgdir/usr/doc/cduce" CGI_DIR="$pkgdir/var/www/cgi-bin" HTML_DIR="$pkgdir/var/www/html" SESSION_DIR="$pkgdir/tmp/cduce_sessions" -C "$pkgname-$pkgver" install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
