# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=11.3.3
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
sha512sums=('12f1dd842111723406ba923fc0950c07c3b0c98a09a77f28d7389695936c681769d3ed58e08d16c9f58f6f12cd39d7816836e9feae3b2365cc519a21d5ba52de')
[ "$CARCH" = "x86_64" ] && sha512sums=('26e4f63e764531268692ea1e79d090fefa4ba5911a69236b9c316b0e04e7e8b8c448043d9c8c43a7d41babbc65209a06f0477ab7fa9ffb56cf35372f13329624')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
