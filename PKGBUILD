# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.3.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('1d8822122b94019ecfa2040404cc23905f522d5e493084225bebc99987c7038250ad6d18f8cdd2741e4e9d6852e29c8ac8342990ad6560ad475f22440d7b75cc')
[ "$CARCH" = "x86_64" ] && sha512sums=('70b64eda09ea1003d89ebaa34eeb48cbc274907880fb0bc6b4ca16515eb4b8d97dbf662b1ab239d18d0876677b7758e5ff9477412c24601f9da9059ed1d72400')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
