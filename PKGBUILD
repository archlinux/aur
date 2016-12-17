# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=6.2.2
pkgrel=2
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('6e09967b7c71e8c2282794ef033e1e1f32a1246a9b931a798c42aa5145b6fa2c9761f65e482a0895c846d480bd012f285ac64da6eb5bfc4abf2b17fe273bcafe')
[ "$CARCH" = "x86_64" ] && sha512sums=('5de59c55c5e61fa89fe93ad5d0faf3e6deee5399a856561828ce04b00cf9f9f2c228844ece34c9a5a7cc04871305fdd4650a5652a7f842479f9fd0e9f5ebd261')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
