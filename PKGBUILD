# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.1.0
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
sha512sums=('68be328bfeb25807147d937e95a9a14d0820b17dbd3bf7acfdc549aec891e092c2e7117448086450431bf37d3db041803f2545a91c1a89fd94f89ec1d30a6c1b')
[ "$CARCH" = "x86_64" ] && sha512sums=('29fad0698f7274d3c5953dc019a5c0ca41d38c9202b69013a64149a1e9b4cbf2ec5f6c295cead8ba93b705d571e55a06dddb8fe7397a17b994f9954eddf31b7c')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
