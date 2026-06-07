# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=13.4.0
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

source_i686=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_i386.deb")
source_x86_64=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_amd64.deb")

sha512sums_i686=('a27b422e02db025fb9431381df7d9059333d734215a70aeaa3379f2a3683cce01c092e486dfb01aa5369d81fb350961389eb173578b194572bb2e11000646e63')
sha512sums_x86_64=('b3a46067c3aa873c2df59d566d0b6c14b630d7e1d0dec2b82ac2f07fdd1810c7a9a90c87d1fde07dabb1c554b4d6b5329f5456eb296747adfd5130c629e4b447')

prepare() {
    tar -xf data.tar.zst
}

package() {
    cp -dr --no-preserve=ownership opt usr "$pkgdir"/
}
