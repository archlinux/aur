# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=9.3.0
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
sha512sums=('3cb5cebc162360c565d81a26d7b4a1e5f197097d750cba58f1508f123da16aa505e30ffb86f5c8eda02a92084a4ca38fb4f56da41cd9f4d6d635ae4a564f5c04')
[ "$CARCH" = "x86_64" ] && sha512sums=('56cd0481bfcf78ebb0903c9afbaa924032b7b560a2a065099eaa805bb82ecc8c57ff836b76db3a4247992b6beca1a86e2c6afe9e6460487d8e5d48b4bdf51600')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
