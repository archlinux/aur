# ContributorMaintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer:  Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gcstar
_pkgname=GCstar
pkgver=1.7.3
pkgrel=1
pkgdesc="A collection management application"
arch=('any')
url="http://www.gcstar.org"
license=("GPL")
depends=('gtk2-perl' 'perl-libwww' 'perl-xml-simple'
	 'perl-net-snmp' 'perl-xml-parser' 'perl-switch'
	 'perl-xml-libxml' 'perl-sort-naturally'
	 'perl-http-message' 'perl-http-date' 'perl-http-cookies'
	 'perl-gd' 'perl-date-calc' 'perl-lwp-protocol-https'
	 'perl-archive-zip' 'perl-datetime-format-strptime'
	 'perl-gdgraph' 'perl-mp3-info' 'perl-mp3-tag'
	 'perl-net-freedb' 'perl-ogg-vorbis-header-pureperl')
optdepends=('perl-image-exiftool:  to retrieve data from a mkv file')
source=(https://gitlab.com/Kerenoc/GCstar/-/archive/v$pkgver/${_pkgname}-v$pkgver.tar.bz2)
sha256sums=('9b5b1f6b37e73b3401030a0816acc6922c9f65e56d94a279b615e40a1fb5915a')

package() {
  cd ${_pkgname}-v$pkgver/$pkgname
  perl ./install --text --prefix="$pkgdir"/usr
  install -D -m644 "$pkgdir"/usr/share/gcstar/icons/gcstar_256x256.png \
                   "$pkgdir"/usr/share/pixmaps/gcstar.png
  install -D -m644 "$pkgdir"/usr/share/gcstar/icons/gcstar_32x32.png \
                   "$pkgdir"/usr/share/pixmaps/gcstar32.png
  cp -R share/applications "$pkgdir"/usr/share
}
