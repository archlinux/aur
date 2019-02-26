# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.9.4
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('fbf4590cae304d5f5779dab27f76a32e618d4c30315fadcf01621925aa4a75a07b1a6601feb7dfc75650c24e8aa1a2453c205174b702c4c7d3207d6d12b7fb70')
[ "$CARCH" = "x86_64" ] && sha512sums=('e35e651b94e8b6c9da35a87c2b80a73a0f402a32720c45c7307d8f3940d1ddb5dd98db25da7d9afd26cf3b31ad53e556a91d04b0da4df687ff2fef773fa72baa')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
