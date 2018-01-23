# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps3000
pkgver=3.10.0_3r09
pkgrel=1
pkgdesc="library for picotech oscilloscope 3000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='d12775dea4674998ec48764370563dd0'
else
  _arch="amd64"
  _md5sum='12b8ebfe12db9280770d08ac7bfbc7d7'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps3000/${pkgname}_${pkgver//_/-}_${_arch}.deb")
md5sums=($_md5sum)

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
