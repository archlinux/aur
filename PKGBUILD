# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.10.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('b839a69d04ec9fb8f32a992b994b10a0eea407e8136e617722342ab70449bd3bb3e5cba8707a3223ed7ad0d0ddc9990e3eabdb3224f6279007b292ffd5d0fa12')
[ "$CARCH" = "x86_64" ] && sha512sums=('33cf6a098ba9367d26dfdb179f4041015fb5e727b9ab879be314cda64578e6a1b713001770f01b6d51a0f545b3497a3cee1b7060ea6125264de1c34b4d1d44a6')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
