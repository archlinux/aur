# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps5000
pkgver=1.8.0_3r10
pkgrel=1
pkgdesc="library for picotech oscilloscope 5000 series (5203, 5204)"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='04e4a3212dcc296d8aace34825c042ef'
else
  _arch="amd64"
  _md5sum='2857b50ce7c43a1b8885900b1b504855'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps5000/${pkgname}_${pkgver//_/-}_${_arch}.deb")
md5sums=($_md5sum)

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
