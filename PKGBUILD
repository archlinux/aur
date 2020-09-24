# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=9.0.0
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
sha512sums=('0057a1dd2f874619a4eca0771e9156ac54c66f4920c13dfbae41b3e922c4b24374642a850fd99658305424a18ac9ac3f550b34c10b530e035dd933d291612ca9')
[ "$CARCH" = "x86_64" ] && sha512sums=('3d70f77f0dc10679b94328a79eb3b50dff7d1ff10451c0a914870547afeb079cd271b8f19dddc15ef44e75d42a0bd702d22870907fc90ca1c1d5ddfe944cdafc')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
