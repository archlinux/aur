# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.3.1
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
sha512sums=('8a016d3e15702352a6f408b6d4562f2e4c7e946f5095d6dcaea94e6e621d3af746820ed9947988e543db9a8f4439335c90f2207ee5fe1b1a5408de0e3f6170e8')
[ "$CARCH" = "x86_64" ] && sha512sums=('0c70c9f4827949adf4f4f4e88e5d25dcc1984c6ee885a7940ba72709c304339ee9a1ccb1e4f6cf0f0b0068030984dac3338b6e45b2f0af5245ab2c4fd3944691')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
