# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=6.4.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('eb45560e6ebc2cb78934976b4f6c864cacdd6e9bcd0eb79ed7a423249a674894f3b962fc3ac3a138ffae25f1920d53400b113a5f803604a7feca8bddc99b5197')
[ "$CARCH" = "x86_64" ] && sha512sums=('209847b6ab55abc522b795901d5dcda828775bbc1d883f1c497046678d4d0171dc1fa5b0414a92a64ccaeb12fa9112e4dce44d8c8f03ec3976cd0f61fd5e933a')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
