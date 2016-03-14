# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.5.1
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('050afccbc74f54c467438714e3bbf6b0fd4ac7d770e6085c6275f670703c179b3eeca247ad0f9da0bd1914d9e70a1548ac1dcf2d0f280a74bbe471db235ec390')
[ "$CARCH" = "x86_64" ] && sha512sums=('aa8e481401028234b86b1ec234a2b24a32322c0409c579995e97324ac9df85be2783927b5867cf0bd3deb5576f9782939038b3183ad39b8772b01e7747e85a15')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
