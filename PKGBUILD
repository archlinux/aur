# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=libmapscript-perl-bin
pkgver=7.0.4
pkgrel=1
pkgdesc='Perl MapScript module provides MapServer functions for Perl scripts'
arch=('x86_64')
url='https://packages.debian.org/jessie-backports/libmapscript-perl'
license=('unknown')
depends=(
  'zlib'
  'perl'
  'libxml2'
  'cairo'
  'libcurl-gnutls'
  'freetype2'
  'fribidi'
  'gdal'
  'geos'
  'giflib'
  'glib2'
  'harfbuzz'
  'libjpeg-turbo'
  'libpng'
  'libpqxx'
  'proj'
  'librsvg'
  'mapserver'
)
options=()
source=('http://http.us.debian.org/debian/pool/main/m/mapserver/libmapscript-perl_7.0.4-1~bpo8+1_amd64.deb')
sha256sums=('eec1311fc6e89fae907b9175b251d57713defa22c8bdcc4cd0d84dee5e2bfbb3')

prepare() {
  cd $srcdir
  tar xJf data.tar.xz
}

package() {
  cd $srcdir

  install -dm755 $pkgdir/usr/lib/perl5/vendor_perl/auto/mapscript
  install -m644 usr/lib/x86_64-linux-gnu/perl5/5.20/mapscript.pm $pkgdir/usr/lib/perl5/vendor_perl/mapscript.pm
  install -m644 \
          $srcdir/usr/lib/x86_64-linux-gnu/perl5/5.20/auto/mapscript/mapscript.so \
          $pkgdir/usr/lib/perl5/vendor_perl/auto/mapscript/mapscript.so

  install -dm755 $pkgdir/usr/share/doc/libmapscript-perl
  cp -dr --no-preserve=ownership \
     $srcdir/usr/share/doc/libmapscript-perl/examples \
     $pkgdir/usr/share/doc/libmapscript-perl
}
