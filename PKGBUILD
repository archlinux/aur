# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.4.1
pkgrel=0
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('c0b439f8c8f621a299cb7b9510428352e4e21e21a962d4f2b5bac807123377c7dbb79f0e2466ed9fee54d3a87d2d4d9f0ce200187d2b6ea37b93f334b50cd774')
[ "$CARCH" = "x86_64" ] && sha512sums=('2572ec6eb13c6ac0009479b3bc255299061e098ef25b0b14e596908045295bf79e941e6d3d8db4bcd89253d749ed6073464978fae64c187f01f98aee70e2dd98')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
