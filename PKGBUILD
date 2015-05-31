# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: bl4ckb1t <bl4ckb1t@gmail.com>

pkgname=ices2
_srcname=ices
pkgver=2.0.2
pkgrel=2
pkgdesc="A source client for broadcasting in Ogg Vorbis format to an icecast2 server" 
arch=('i686' 'x86_64')
url="http://icecast.org/ices.php"
license=('GPL')
depends=('libogg' 'libvorbis' 'libxml2' 'libshout')
source=(
  "http://downloads.us.xiph.org/releases/ices/${_srcname}-${pkgver}.tar.gz"
)
sha256sums=(
  '7bf7a9c5bce1b6465df8dd1491e303544990006b8ef01f8ba8eeb38844588859'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
