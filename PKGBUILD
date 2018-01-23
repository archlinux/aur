# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps5000a
pkgver=1.4.0_5r10
pkgrel=1
pkgdesc="library for picotech oscilloscope 5000a series (5242A/B, 5243A/B, 5244A/B, 5442A/B, 5443A/B, 5444A/B)"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='419b55500e837b8a5e8150255a8d967a'
else
  _arch="amd64"
  _md5sum='419b55500e837b8a5e8150255a8d967a'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps5000a/${pkgname}_${pkgver//_/-}_${_arch}.deb")
md5sums=($_md5sum)

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
