# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=11.2.0
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
sha512sums=('49e989e50d0f2c359ab57e8ecab4a65271a8f03d1c3005d54331b96f80ef3935c2f8c50176748fbb726e105625a8ba36b77dd1437831cd07c2bd5adb7e6cd0b8')
[ "$CARCH" = "x86_64" ] && sha512sums=('09097504030eacea732b92e7d661151ad25107c792f68e9866c6d5513e5301989529650dbc1e4a8906dca4e9d6ecaed3f09a6d330bd35375c9d5df7d15f0069e')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
