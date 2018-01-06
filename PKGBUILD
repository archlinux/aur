# $Id: PKGBUILD 275582 2017-12-22 23:33:04Z arojas $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gcstar
pkgver=1.7.1
pkgrel=1
pkgdesc="A collection management application"
arch=('any')
url="http://www.gcstar.org"
license=("GPL")
depends=('gtk2-perl' 'perl-libwww' 'perl-xml-simple'
	 'perl-net-snmp' 'perl-xml-parser' 'perl-switch'
	 'perl-xml-libxml' 'perl-sort-naturally'
	 'perl-http-message' 'perl-http-date' 'perl-http-cookies'
	 'perl-gd' 'perl-date-calc'
	 'perl-archive-zip' 'perl-datetime-format-strptime'
	 'perl-gdgraph' 'perl-mp3-info')
# 'perl-ogg-vorbis-header-pureperl' 'perl-mp3-tag'
source=(https://launchpad.net/gcstar/1.7/1.7.1/+download/gcstar-$pkgver.tar.gz)
sha256sums=('da2c90071a61bf42f4c6e9f6ddee6eb9b60b8f9af711c435cd24d44735429f3d')

package() {
  cd gcstar
  ./install  --prefix="$pkgdir"/usr
  install -D -m644 "$pkgdir"/usr/share/gcstar/icons/gcstar_256x256.png \
                   "$pkgdir"/usr/share/pixmaps/gcstar.png
  install -D -m644 "$pkgdir"/usr/share/gcstar/icons/gcstar_32x32.png \
                   "$pkgdir"/usr/share/pixmaps/gcstar32.png
  cp -R share/applications "$pkgdir"/usr/share
  mv "$pkgdir"/usr/man "$pkgdir"/usr/share
}
