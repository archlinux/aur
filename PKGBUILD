# Maintainer: Don Harper <duck at duckland dot org>
# Contributor: Kaiting Chen <kaitocracy at gmail.com>
# Contributor: Pete Morris <pete dot morris at gmail>

pkgname='chronicle'
pkgver='4.6'
pkgrel='1'
pkgdesc='A simple blog compiler writte in Perl'
arch=('any')
url='http://www.steve.org.uk/Software/chronicle/'
license=('GPL' 'PerlArtistic')
depends=('perl-timedate'
  'perl-html-template')

md5sums=('0831867886591c0a747ec1b3139d7e17')
source=("$url/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i "s|^prefix=$|prefix=$pkgdir|" Makefile
  sed -i 's|/usr/local/bin|/usr/bin|g' Makefile

  make DESTDIR=$pkgdir install
}

packege() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 cgi-bin/comments.cgi \
    ${pkgdir}/usr/share/${pkgname}/comments.cgi
}
