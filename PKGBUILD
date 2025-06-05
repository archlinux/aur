# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.9.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')
_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('4247fb3da9a74c048d0f4edd921a452689f40eb238b316bc2031c55d82d35187fe5a068d2a0f5e08ee0be52ed626bb330b26dcfbeacda22682af9d29d3452fd5')
[ "$CARCH" = "x86_64" ] && sha512sums=('fe80028445caad5a3cc0b8dfbf9212b324d91b36f6bd9f7c1dd82915f2319a7fe475b260d4e8cee2850b3d1de7fd597c90c5de25c4b6f7ceea51bdcc72943fa5')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
