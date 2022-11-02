# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=11.1.1
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
sha512sums=('c4f0d2f16c060176f7afbae53c545f21faf7ab330fdb94bcfccca3974f881274d7e839b5738f719611ab0c6ab04d17a8d181f508e5f1f5dfc67b5852a7814aa8')
[ "$CARCH" = "x86_64" ] && sha512sums=('a555a2007b383fb63f830ee7109f3400e4215487a3fe7354f26d71ffd70e59b1fb45eb0ff3b133726972b9e5558acd18bf3520cbeb25b482e4741486fda14172')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
