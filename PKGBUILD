# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.0.2
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
sha512sums=('cf0b98d1ca7b234e781cbc95dbd31a97e861350dd9291d055fdfc69724219fb27b6b2f6fca25b89a9524016412ab0c5a2193e782c589c573b5f679c9f88cf8ab')
[ "$CARCH" = "x86_64" ] && sha512sums=('f7d6d757a742cd2b78636e60e0d63f7dbb8c9d36f5410faee753fec0d2fae7f859db4230eb4aa7f2bb642cbd9d493ae3677fda4206c01228a85cdd9f11d1333b')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
