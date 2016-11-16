# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=6.2.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('65270a5634fda2b7500dcb73a64a49be6559c377e9d7a41e142469ea463428f7a83e3b41da495ab9ef323d870fc91578356b0b5ff4ea49fc944f874cea4f39df')
[ "$CARCH" = "x86_64" ] && sha512sums=('28c8b2cf95bc27f43a11b753480e515cc1413edd25554691c125217707544b6872ce55d148aef3fc032f57fde319fb9f04471ae15d4e7bcd03d42d928cfecea3')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
