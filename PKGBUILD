# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.10.5
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('503f0e550942e32c58f31b70f8b91fddbf347c3bbee571857ebd20fdda035004e8c7e8d2d64c1a6de122b5ef478bb98663d0fb3d392b1ca2c60a925df8d109e0')
[ "$CARCH" = "x86_64" ] && sha512sums=('4d40e8c701982b36e4946d9345d2648897be98e9ef73770ccae5ca59aa23ae767d9b96831033585d9c0394b106ab3322e003330fb11f6496d6a15927516ac2a1')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
