# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.1.0
pkgrel=2
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('7dad4f75bcdf39d263e240df935f658de52764764f65d2bd778357a3b205f9e551a4a36894fa5109845198ccd0d1dd1c8519c2cff65facdd4dc72a4244862c34')
[ "$CARCH" = "x86_64" ] && sha512sums=('92e09bda63bc40b014f30cb3707a4a9a09a0e2c16471563715fe4edfbe38151e2ca0e1ca14c02e7e72418a02f6205b942e57c7f4e45fe85a7b8470f6ef18d3a7')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
