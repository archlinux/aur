# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.3.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('a92b2e888d5ad011d5a8df79bc94189b318f607b3d404c1bd28f1dfcda13d5ae8d1ca69fadf83fd4ecbdbf074ddbf411d8e80a737924d8169227c64bb3b9b4dc')
[ "$CARCH" = "x86_64" ] && sha512sums=('544d62c4fd1c0a0b7ed8a36576fce8194e84d33a0ff47fef66c657ef5b2febf1ce125278fef67b2330a44da041f1d00c74d27370818007c13d1d39b4d199c5cf')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
