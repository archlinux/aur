# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.3.1
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('703ea867f1d311f1d591f5a83eb2e2aa50a92bc9b7993a95a4e184990b5bf97ea60da68cff697ed26f4a70cf1208a3be0bd65b70514023c4c3b4d61ed7c4bc18')
[ "$CARCH" = "x86_64" ] && sha512sums=('d9d942cf36d95595877af09ee4033f0dd340157b317dcfd2c48187fcbc447af81f26da16c2d2eba691d7d407be9c439e87b918cb43bc8b0a577ad03d30434c97')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
