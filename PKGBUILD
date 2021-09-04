# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=9.4.2
pkgrel=0
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('4415d544701c047c57b1f0747184ec1097dc4c6470401323f35130852991b63432479dda194bccb9817627523c204f07f992cf3fc16cc245aef95e920367f7b4')
[ "$CARCH" = "x86_64" ] && sha512sums=('2ac722373ce12193c55b5fe40b14fd2c4bb442e1a998ecf6a56a0f6a77cf502cf52bb6d2a39fbbf314cf94807833fda3f9cabe0b425ca8f120895015ce8ed196')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
