# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.0.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('8bf659dee7684ebb2360e3f9227e17773701fdcf77f4b99e30a158622837148ffcc3df2d7741e53d1965b60c08f2def1012f321d73caad6e5daa18d0275154c8')
[ "$CARCH" = "x86_64" ] && sha512sums=('3fae4207b1ce36e4a2cc17ebad7ae8b031a9dd6b565ae44f356cba27d2bba77608351bb45e5761546bbcaeca9532e139d0d062e8d6c0f4a4ccf6d17b95157288')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
