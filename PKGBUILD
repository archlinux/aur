# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps6000
pkgver=1.7.0_6r10
pkgrel=1
pkgdesc="library for picotech oscilloscope 6000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='8d12e29c6388b039b5637e6d0e57a129'
else
  _arch="amd64"
  _md5sum='88ea8b545f4770c910362676573a86a0'
fi
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://labs.picotech.com/debian/pool/main/libp/${pkgname}/${pkgname}_${pkgver//_/-}_${_arch}.deb")
md5sums=($_md5sum)

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
