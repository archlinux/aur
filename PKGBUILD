# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=13.2.1
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
sha512sums=('4f0c963a9051bd488902d8940508413a487c7da9b79815dc59521658dd8437ab4f4e7e09f0db79b39b5d7518b9c39c8f5dc9d7b329149dafb9fb45f53edeb28a')
[ "$CARCH" = "x86_64" ] && sha512sums=('28783f21891957a3a21d35796e8fbca057427141c4f0e91826a86958ec77098e967339d0977bb6bf5379f1181fe18318d883bdf10662942dbb4a98e0e0640cc3')

prepare() {
    tar -xf data.tar.zst
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
