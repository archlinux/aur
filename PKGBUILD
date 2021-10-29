# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.1.0
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
sha512sums=('424df0da79e66bea25a09aa666e9204ac0f82f70df279bf7228f67019d919d4063ba35e6b93f65f320b428790791d010737e642a565eed8541dcdbf8e02c37be')
[ "$CARCH" = "x86_64" ] && sha512sums=('c20692381f9606789b0df9be1a1712b1813eddf9fc17a69478bc10fdb39fd5e15f2af279118baec3421ed80c2b0c6ee1246e3ef3b986f2d7eb9d4f384cc1e541')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
