# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.7.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('5fef0960bc20bac4ad53d5655a9273fd7a40a4a8e4dd38e072daac71b6745e3d64343a55903a1b5a884bbe57b492199134c4f81341924a45da3844a4b21b119e')
[ "$CARCH" = "x86_64" ] && sha512sums=('9acbb797f5fdf5a422d4ff6f2d4477fbea4e7af1acad25982794196cf6e44a69a4789981138362770123a45ed91c06fdd065fed7bef94e02a8eab7be71ad1c85')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
