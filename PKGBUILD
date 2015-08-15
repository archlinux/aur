# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.0.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
md5sums=('7810170f9412d08eefb62d3f2b7e86ba')
[ "$CARCH" = "x86_64" ] && md5sums=('83ca245b2f315ea52efb6f04d656402c')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
