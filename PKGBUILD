# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.2.2
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
sha512sums=('990457798362f7bdf53d606ad5c70f39babe04ea4730ce579ef63c5e905a94c930321dceadb86b69b9d90e963418435d1fe626c91b6b98aab601ed6bdd7517a2')
[ "$CARCH" = "x86_64" ] && sha512sums=('3f88ac2ec61085c64cefb9e22308d1a78b11dfa54b973b97bae0b2e8f7a0b7b0734340844d3ace559d8c5306af1262e95ecf3d3f4d9945b858e92fee8fa182ac')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
