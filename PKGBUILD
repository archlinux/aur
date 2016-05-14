# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.7.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('69a7ffd2af68a888f63f2d6e8d490d025897d9bf034d0a058d9ad88ee427e9f27063235438cc809702d7294ae4946e6415e943cdc689368f12e66231b15e3e88')
[ "$CARCH" = "x86_64" ] && sha512sums=('e7b90cb597b76f880c13d3b4f9e35ab8d1ec6b8e9d60928d07639107e3b4cf06c1467e3ff1cab6984fa7f34d32841f863d55bea5aaed61e377708522ba5e4318')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
