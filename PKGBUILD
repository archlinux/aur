# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.6.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('27c6f1a99a56fa6eaccc1dbf07c0affdc83642c57998e6172edbbbfa7b967c9ffe1a4fa538d3d869890153d0b13442d6fc7c428878a890bce2a134624999ae1a')
[ "$CARCH" = "x86_64" ] && sha512sums=('214cc2032e8ca29caa11d81302a9c0871d1697f63fce1e66ac453fd989c22201d0d0fbfef94410bee95090212ccce3df96af5fecd1a52ea4ba06262fe33841cd')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
