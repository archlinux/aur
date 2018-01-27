# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Matej Niznik <mattnizo@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Orivej Desh <masecretaire@gmx.fr>

pkgname=xml2
pkgver=0.5
pkgrel=1
pkgdesc="XML/Unix Processing Tools to convert XML and HTML to and from a line-oriented format more amenable to processing by classic Unix pipeline processing tools"
arch=("x86_64")
url="http://http.debian.net/debian/pool/main/x/xml2/"
license=("GPL")
depends=("libxml2")
source=("http://http.debian.net/debian/pool/main/x/$pkgname/${pkgname}_$pkgver.orig.tar.gz")
md5sums=('48eacf64b01ca3a4a5afb1a36f5906e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  cd "$pkgdir/usr/bin"
  rm html2 2html
  ln -s xml2 html2
  ln -s 2xml 2html
}
