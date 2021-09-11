# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.0.0
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
sha512sums=('2e25807c7cb5a218bbfcc701c6fd7282212c52e125559523e6d40143713412d780d68042e100a2ff4905a4af33db449eecaa8b75e44c786581d2c157d2ecb2fd')
[ "$CARCH" = "x86_64" ] && sha512sums=('f1d5c187f07197b099589c3e54e772f319115f679297514000eb514156ae934c4162e1afc5f04bbd7053b0a25fd0866bda050ed25e46a05373b8a630e813a18e')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
