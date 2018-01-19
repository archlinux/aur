# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: Oleg Finkelshteyn <olegfink@gmail.com>

pkgname='ripit'
pkgver='4.0.0_beta20140508'
_debver='4.0.0~beta20140508'
pkgrel='3'
pkgdesc='Command line tool to rip tracks from audio cds and encode them'
arch=('any')
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
source=("https://mirrors.xmission.com/ubuntu/pool/universe/r/ripit/${pkgname}_${_debver}.orig.tar.bz2")
sha256sums=('5b01cf33c0649115cd831b12ee4600256fba68c66ea92b1372a1bd8ce6925ab9')
backup=('etc/ripit/config')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=${pkgdir}/usr etcdir=${pkgdir}/etc/ripit mandir=${pkgdir}/usr/share/man/man1 INSTALL=/usr/bin/install install
}
