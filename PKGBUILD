# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.1.2
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
md5sums=('fd22655e465f95689460d79acd68346c')
[ "$CARCH" = "x86_64" ] && md5sums=('31f79a7b707f83c15665b5ff4756b75f')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
