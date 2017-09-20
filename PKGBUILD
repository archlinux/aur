# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Thorsten Toepper <atsutane@freethoughts.de>

pkgname=newsboat
pkgver=2.10
pkgrel=1
pkgdesc='RSS feed reader for the text console with special Podcast support'
url=https://newsboat.org
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl' 'json-c' 'libxml2' 'sqlite3' 'stfl')
optdepends=('ruby')
makedepends=('asciidoc' 'docbook-xsl' 'swig')
options=('docs' '!libtool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/r$pkgver.tar.gz")
sha512sums=('8c5101fd0ca9d70583e7152e970fa268f6249e1d545b4779fc1a58e0741d8e2cc967643d9683220bbe67cddaec17f712f82d488606d7907e1dba6eb3ed8f75dc')

build() {
  cd $pkgname-r$pkgver
  ./config.sh
  make
  make doc
}

package() {
  cd $pkgname-r$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}

# vim:set ts=2 sw=2 et:
