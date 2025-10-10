# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=13.0.1
pkgrel=2
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('mesa' 'openal' 'libxft' 'curl')

optdepends=(
  'xdg-utils: for desktop environment integration'
  'zenity: for graphical dialog boxes'
  'nvidia-utils: alternative OpenGL implementation for NVIDIA users'
)

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('fd56b758473e53d4a92d8bc96afe0004c140fb439a49d8cb010a67ae1edcd2e87e1b636a24cd51c2ceea1a788537f5f4b4559c67dd0ef32e097323e8cb88fb86')
[ "$CARCH" = "x86_64" ] && sha512sums=('8ff252059b6df71c6b1eb5984ad023dc7a9c8ad4045d903e74be4bf26919f12c60a18c0374c6e586ee75643bfa9471c54b5c11425753e48cc3aa8bc0a4a3e18e')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
