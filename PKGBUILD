# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.4.0
pkgrel=0
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('c9607b1b182a598fc7f5914d54535f96894f1d2658ae9847fa62a2465404fc4fe19c073b8fbcc7c8380a5022bd5bf9941882dbe527bfe72846427df1511719f0')
[ "$CARCH" = "x86_64" ] && sha512sums=('2a88bd98779cbbcb9027fb1f98c870ad3c7589034ef75ab7c7b4f59939716230081744ce60b2b66cd53e303572e6815724c44fb192e3d47c031e442540bfbebe')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
