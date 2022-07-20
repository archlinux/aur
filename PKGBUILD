# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.4.2
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
sha512sums=('e6136b3b25218d3b7a60792c19aa8425ed329a9b58282ca1793af135c08f6387ff9ab2d351981002ff0aa38788de9c8dd8e8ce849c74f6c3ebbda5fdc7469de6')
[ "$CARCH" = "x86_64" ] && sha512sums=('d5f91bc1d7ba6330bd777da7fdadee6d63ccea280ec1aebc746574fbdad5cce652804b312546a9eaaaa8a316cac482097d08762d46858a6e67c560616af07d64')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
