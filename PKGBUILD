# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=9.1.1
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
sha512sums=('938037bb6d7ff8553c5bbd5cd8a39b6c615d72a6ce56597c604ee2830c2d5b58f561de07bdf3d831d86c3839beb26abbc042701c868c3331b9954c9755447241')
[ "$CARCH" = "x86_64" ] && sha512sums=('e6ddafaff0f3e46390d80eecc4d2a8d3228f09d7b59ff500ffc5fcb8b57c1508b62587fc2c2203d2e6524db0e741e7de5a3068d1c5e3a4cf8d8c00581b15be7a')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
