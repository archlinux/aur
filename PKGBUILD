# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.3.0
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
sha512sums=('2e2ee68b5603d45566a5d843c8ab6ea9cff910d7de4afe39fcaa29169da4f595e62bbef2d95eddf66524369f89474c9aeda3ad7a064bdc831aba41024d00731c')
[ "$CARCH" = "x86_64" ] && sha512sums=('c16dfa4b65d30c1763586a5f3e4880198470ee7aec8929c60adc505ff428b234093eeb5eb9cbdc04e062d05052771035da253e8908d3e05f485f066dd205c429')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
