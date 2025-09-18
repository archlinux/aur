# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=13.0.0
pkgrel=1
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
sha512sums=('8a9406080ed9bb1a61e597ea8623c2cb3bcee46956c7145237e8cb53579a0220a2d0a6d2b9b89e7ecb8cf376d7eea7ace2c4cf5ca953057d9cb2c8536a03c222')
[ "$CARCH" = "x86_64" ] && sha512sums=('097fd26f92081ef5da820baf86b6df1d9184c714ece3be88b2264553242692637b970505341442882ec5c7afe88d88ab34570bd26e715c36165f39fe1ae657fc')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
