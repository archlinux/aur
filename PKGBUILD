# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=9.2.0
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
sha512sums=('ea134986c8c654b624f173fc50447f38048321377e83cbc2a6ac4cf0bc3ff722def6a359b132acfab413ab2defacec5d2e0674ec4bc2095ded2186b3f40eb648')
[ "$CARCH" = "x86_64" ] && sha512sums=('f0a27ed49e6d33fc521b671e2d497b0c0a67012878691628298ede827e1cbd4611dad238e2cb57430904dc3c367cba1481d88bc72b8e7acea9b0dbc01cd16830')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
