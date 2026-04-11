# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=13.3.0
pkgrel=1
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
sha512sums=('e2d8b6c36da449993b81d133a9d6470639085c47838c19879d6ba61ee831162c1f604a57af4b17731a8d6d851fc6eda865d795ddb168e6ca7b3830e4669ab485')
[ "$CARCH" = "x86_64" ] && sha512sums=('8682aec7a0385b0a216c3339c0fa29bb045d778c0f6920c2c82b8fe70ec869ed17cf188be7241b6b87330e69314f9b5ead21cdab02f006b6c60ae81248ba805a')

prepare() {
    tar -xf data.tar.zst
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
