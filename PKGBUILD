# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.0.2
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('12f32e383ed47c57cda6d87379d0d82ab0e957a64ca76cb23b5d4432f2602331754f8f2aaf12a009ac743f13102b1d46f96be452df616a42e21cf9d35e5090f3')
[ "$CARCH" = "x86_64" ] && sha512sums=('50e15540902ec065d39f9dd1f200f9ebd11812d288b9e693cd815aba1207a09f4e6888a5582bad83f062c6bc4ba61857d780dd0458fe959a66feea067c8f1b6c')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
