# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=11.1.0
pkgrel=2
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('ac4122f0744d1e938e8cf497899dfc427757e8f5259c22fb8d61bb61ca24d59951126ce78b2ff85e4660e93bf6368ea6edc1322fa14ba7eb5547d15d0f555c20')
[ "$CARCH" = "x86_64" ] && sha512sums=('6ac688e4df9634d3cce3916f9f9e4bcd522d32e717eee1396b48fe667a454d9e1a3f5af33e22d0791c1b3d46efb26a9a041ffb17ef701054cb5a931aa36502d8')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
