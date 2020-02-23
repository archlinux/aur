# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.2.3
pkgrel=0
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('3f6d6998ea58c1cb4bef7cf21e0fb376b8c3fd81fe3935bbc2647b763d1ec4b24928942bbdce790e2a812f58560482c1a8138c9c5d0a707a1d8d9e97fdccc97c')
[ "$CARCH" = "x86_64" ] && sha512sums=('6f3504303f123d572add0c794e06647e2bcfcad971ed421826a8cd5ed7fa47d870b30d589f28894cf084bcae1e9f8318ebdcc0c91d1497b8e9fd178ba5144ba9')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
