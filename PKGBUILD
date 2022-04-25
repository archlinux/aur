# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.3.3
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
sha512sums=('432ee5383218033a1b98d8d746d2bfca89d287eecbc8d378deda59a9b49463398a0d536b35cde3327944aa250684c3d1c36ac87e42f9c8f5bd0ecd5d58eeb374432ee5383218033a1b98d8d746d2bfca89d287eecbc8d378deda59a9b49463398a0d536b35cde3327944aa250684c3d1c36ac87e42f9c8f5bd0ecd5d58eeb374')
[ "$CARCH" = "x86_64" ] && sha512sums=('cde2498b550e236391600a67f8c224adda654f0fc8332baca3c53ae4e0ffbe02444e26cc6c7d276faeaf64fc30b731f869650e422f4b50aff5b010004c75aec3')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
