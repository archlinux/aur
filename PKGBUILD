# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.1.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('58076afab041eb8ebe2abd4d9e19f1992fd819185d20bb077dac3d699617894071428c034df40cf468be460236de703a1f1d9928bc358aed5bd90d3f5e449de3')
[ "$CARCH" = "x86_64" ] && sha512sums=('79c022e88305caa2cd298209aa829f7592775ff0d589db775cae8a6fa1fb3694cf1cae90c2465b18fbbd08bc1490f065f301fefd637b312ef6035e092358c33a')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
