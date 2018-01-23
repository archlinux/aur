# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps4000
pkgver=1.6.0_2r10
pkgrel=1
pkgdesc="library for picotech oscilloscope 4000 series (4223, 4224, 4226, 4227, 4262, 4423, 4424)"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='21e3e8f9a9f1c2e22f232ec0886ae6e7'
else
  _arch="amd64"
  _md5sum='93c7e737cf280ef092d35b2d1c61ade9'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps4000/${pkgname}_${pkgver//_/-}_${_arch}.deb")
md5sums=($_md5sum)

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
