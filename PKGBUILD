# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.8.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('864b608fcca9eb2c299be893f952ccddeb9ed718785c9a0e49b0e916da8b174bdfb4370ad86ee5d20efcad007592d1dda300b8f5a3c1af95a003a4ff9eb4d196')
[ "$CARCH" = "x86_64" ] && sha512sums=('2da58db10cee305919d406bee6c403e237f059f84e7b7049ea2f5b8a2dc8009c8ac2d45430d84939e40923ebf1d39c67299e8623183f0d9518ff106dd0eb1e06')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
