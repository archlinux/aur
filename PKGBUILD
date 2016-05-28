# Maintainer: bzt <unmacaque (at) gmail (dot) com>

pkgname=mod_markdown
pkgver=1.0.3
pkgrel=1
pkgdesc="Markdown filter module for Apache HTTPD Server"
arch=('i686' 'x86_64')
url="https://github.com/hamano/apache-mod-markdown"
license=('APACHE')
depends=('apache' 'discount')
_srcname=apache-mod-markdown
source=("https://github.com/hamano/$_srcname/archive/$pkgver.tar.gz")
sha256sums=("62111266af0a1ee5ea7e595caf94ea33d1459d633ae0e063edc173fae243810f")

build() {
  cd "$_srcname-$pkgver"
  autoreconf -f -i
  ./configure --with-apxs=/usr/bin/apxs --with-discount=/usr
  make
}

package() {
  cd "$_srcname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
