# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.2.0
pkgrel=0
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('b0efbe304f49bbff2106137552d51ce688f5a4695fe443664d01a7c1f4d720ca2e2b833f2a1323f8dbb5d891556941ac1dee7154a432adbed2d26183e3b01eb6')
[ "$CARCH" = "x86_64" ] && sha512sums=('d2dddf6a12fee84defbb1382c37af70907823d780a5dc5f137a08463362b493be5781fbb02029508a810b13d61af25fd1209d8c84ca03a8dd960d06c1afc4a18')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
