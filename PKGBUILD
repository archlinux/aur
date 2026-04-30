# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=13.3.3
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

sha512sums_i686=('bbd5204708d03081a4280ea11af5e0565181d95a4df33a36d13b368ba2de24d71d6fdff7a455c355b2182b2584730e1c79116e52237648bf4c815fa4bd06b488')
sha512sums_x86_64=('2a5160e7e3aaa399a8e64a2105f3a2ef4c51b5f4c4c1d240602a3cb4c805ea1db7e38791dfb1880c223678159ab00f0f121056cc3857783dea9902fe039b8877')

prepare() {
    tar -xf data.tar.zst
}

package() {
    cp -dr --no-preserve=ownership opt usr "$pkgdir"/
}
