# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=11.0.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('ed7358ea9c5e353da12b9486cb9477e8094ea23d2feff3d84bdbd553e05acd41321d10108813973fbd15fcebd6f782e83a5692190a7d76b0cbe8a4bd5806968a')
[ "$CARCH" = "x86_64" ] && sha512sums=('7d868a8019ebb87b29f0b60c81ad2d0810f34c64a3f736a9697cb4d9a157d18dbcfad60a6aae21f8220c5581a0f62183d25edf10fcb1de0f8ec8f2996497ce04b')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
