# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=6.3.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('af10082465c45182b0a40b83573d05df89879fefa5fbe92be41b6ec819482b92b32f5123548dcaa83b8b4a58011051a19c20e65b5307dbb50494e512c6ce20c1')
[ "$CARCH" = "x86_64" ] && sha512sums=('ec7239296e1b32fd458d6a7c2bc517d7d9ba968464c1dc49766e965a7901f54af4b3efbe5ad1a77ce0bbafcd1ece15dd70a1e9f30c16bed92f98ba63dbbbf502')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
