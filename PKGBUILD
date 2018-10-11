# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.7.4
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('ce9de071f106a51d0a9145198f58812ecf0d36c5ff5dadec36f2a41a2ef321ce29acfc6c7e36996980492a177e20f1764cc38902da7f723bc0fd85422d1b8a68')
[ "$CARCH" = "x86_64" ] && sha512sums=('fd01f7fb9f764f0ff5073e4359985f6f35939d0672b161ca367cba56bae524b5e686675c6f03a2b5665893888db6ca20e02c0bb310b9529515525abfb2030b15')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
