# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.4.0
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
sha512sums=('7567dd4ea086f1f7b4d3134b540bfa7d57402e4849595bff6e4245975e46e35ae9eefa049cbad685b57414742c5e71af06beec2844f3a95ab5c97cff88a677c0')
[ "$CARCH" = "x86_64" ] && sha512sums=('f011e2a983491db5fc876d8063180297f1c9d6bd33158c5317dd332c57383c052c5ccc7e90b5cd4d611f2ddd853c19564a605be86ffb0a8ab60124e0c2284e27')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
