# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=11.1.0
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
sha512sums=('149ab9039e69fd07ab7abaa116d7386ebbe7d4823d0c4ee678c749c84adcb92a880132e55ef11f762c117b043f8b9c0e345ac5bda181f4230379c28ef1c2a71d')
[ "$CARCH" = "x86_64" ] && sha512sums=('88f760f72dc51dd20cf3b227f6f508adcc8abcb406af16b07d07cf9251df988b5fb1bdab131231ff3b6ec69ca9608a8933d730bfbf66019d97301b4b1c533c7a')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
