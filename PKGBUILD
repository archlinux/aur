# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.3.4
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
sha512sums=('e5b767660376e750469a28155db183d39d467a938cec07523f173ad9efd7dd1dc083e76979bfde8fd046b4739ae5bae486d2182a8750a58166787350590ec796')
[ "$CARCH" = "x86_64" ] && sha512sums=('c8fb74f7b11761be9f468b1cee6f0fc67099b1969fa7c9302620f427998bdeda7d4eb7621c22f30edb1082d75b3d0c5da10ebabbc6ce6007f8af02a354d8af64')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
