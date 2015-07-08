# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: MacCyber <jonas.enge at gmail dot com>
# Contributor: Jonas Heinrich <onny@project-insnaity.org>

pkgname=acestream-player
pkgver=3.0.2
pkgrel=1
_ubuntuver=trusty
_ubunturel=1
_watch=('http://repo.acestream.org/ubuntu/dists/trusty/main/binary-amd64/Packages')
pkgdesc="ACE Stream HD multimedia player based on VLC"
arch=('i686' 'x86_64')
url="http://acestream.org/"
license=('unknown')
depends=('acestream-player-data' 'acestream-engine')
conflicts=('acestream')
install=acestream-player.install

if [[ "$CARCH" == "i686" ]]; then
  source=("http://repo.acestream.org/ubuntu/pool/main/a/$pkgname/${pkgname}_${pkgver}-1${_ubuntuver}${_ubunturel}_i386.deb")
  sha512sums=('630dc4892e071509b08b128ab4269f86c3c3c8a2b24c9b2ad6c188c8b65e388c8e08465ec5b38c024d9621219507535b2344b678189fa2fbeb752e80ec7e068d')
else
  source=("http://repo.acestream.org/ubuntu/pool/main/a/$pkgname/${pkgname}_${pkgver}-1${_ubuntuver}${_ubunturel}_amd64.deb")
  sha512sums=('04fcf89fb2a0c5f1d34ea37c13c3193a1522167033ae3f28f111d9444f16369d0cb287463ca3245ea5a8609476e839630bca8b06ba4153056653190b52681271')
fi

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"
}
