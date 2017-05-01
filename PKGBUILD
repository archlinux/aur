# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=6.5.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('59b310fb43a5294fb21de7ff5126bd7cf008ad3e4a3653526ff77d2a616bdfc00c81b266b460780f506dbc58658018162c60e864568bec01a3ad5ec0cba59186')
[ "$CARCH" = "x86_64" ] && sha512sums=('224371cdabb5957b13650aa0fd957963889cf2fbb3cec304f03ed81ad260c09062f11365cda02332a4a0431e709eb6e90c94f9ec04fa3a1995d9e651f08fbcce')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
