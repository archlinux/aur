# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: Oleg Finkelshteyn <olegfink@gmail.com>

pkgname='ripit'
pkgver='4.0.0_beta20140508'
pkgrel='1'
pkgdesc='Command line tool to rip tracks from audio cds and encode them'
arch=('any')
url='http://www.suwald.com/ripit'
license=('GPL')
depends=('cdparanoia' 'cddb_get' 'perl-xml-simple' 'perl-mp3-tag')
optdepends=(
  'flac: Encoding (FLAC)'
  'lame: Encoding (MP3)'
  'vorbis-tools: Encoding (Vorbis)'
  'wavpack: Encoding (WAV)'
  'musepack-tools: Encoding (MPC/MPP)'
  'faac: Encoding (M4A/AAC)'
  'normalize: Normalizing'
  'perl-libwww: Submitting to CDDB' 
  'libmusicbrainz3: Tagging (Musicbrainz.org)'
)
source=(${url}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('aba1187fc3040ef4814c43e5c788bbeb')
backup=('etc/ripit/config')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=${pkgdir}/usr etcdir=${pkgdir}/etc/ripit mandir=${pkgdir}/usr/share/man/man1 INSTALL=/usr/bin/install install
}
