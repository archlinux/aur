# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.9.4
pkgrel=2
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('mesa' 'openal' 'libxft')

optdepends=(
  'xdg-utils: for desktop environment integration'
  'curl: for network-related functionality'
  'zenity: for graphical dialog boxes'
  'nvidia-utils: alternative OpenGL implementation for NVIDIA users'
)

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('03432c3bd70ab58b01026d23f52713162c6d181304130620fcb4e2c35a60520e4014c1406f7e85dac8836a81cb3595630798da67db87ec40349c00c5b1cd1b03')
[ "$CARCH" = "x86_64" ] && sha512sums=('9c9b01a033cc6ded45486ad6109f862060bf421e9174ac5b63d5ba51f6b0ab11ea87475c693feb59ecfca35e04a5d222f3841b25f2df90dec1519471d10723d8')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
