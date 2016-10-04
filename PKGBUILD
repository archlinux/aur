# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=6.1.1
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('4cbd84fdc3938596e5c7bcecfa7dca5328001cdd09f569767b76541d1a489ab67f0cf6fc11e834ce41b1c3425937ed33d4757e9937047774aedf9ac5d7115536')
[ "$CARCH" = "x86_64" ] && sha512sums=('6bff5d4b07bdc33565840bcce0c11c92209369c22307c23f3de3cc5ccd3032893f5faa3670be16d1357937d8b4e87a864d2644715ce85748afbc9d45d54ce52d')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
