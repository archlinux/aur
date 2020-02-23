# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.2.3
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('7698c2353306663313829c60421d081b27f563764ca0abaae3525803eb51ad4bc0f8a874df772fa93eb280ec0af63a09ff31b2d078c359874fb6d3e2a655318c')
[ "$CARCH" = "x86_64" ] && sha512sums=('8ce7209654178dcc998dd6c6dde5e3d2b2cba729f73834c311d3e28fe5af70973c71b396325ec00f789c3c1e3a3169e2fe9fb510ba7826f8ea933f67939fdebb')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
