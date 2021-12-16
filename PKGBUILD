# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.1.4
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
sha512sums=('4504260d441e9e2ed100e9a56362ff99dbed6aa7fccf92f6c084cb18857154ece240193cc11ed7f50ffa9c4b61a6a301b5c9408008a079c523fee3686978ca9b')
[ "$CARCH" = "x86_64" ] && sha512sums=('ae075c6ff5d2b44e05fee222842c648ace27ad334919b2ad5e5b79d11cdd1ef338589cd8ead3c7c702fdc6942f71f4c9a11c2889b4995285a2f85707053f3aea')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
