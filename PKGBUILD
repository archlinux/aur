# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.1.1
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('025fc65099dc0263f0d84a9d22ab35bfeaf4d9dc43f661fa989075ac91d06dcb401b6c279fb6549451c0f2974a2b3fe54846469d2c5e9b41831eac1f62812c3c')
[ "$CARCH" = "x86_64" ] && sha512sums=('853247b6ea09c0be500832a646dbdd3dfb8615f7980f7ca4c3ac234531de07a0bfa68fc8d6dd2b5fc0256047f9e46a1868d15716ffd09f747915e9979fd157fd')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
