# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=9.1.0
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
sha512sums=('1970af5bb1bd39457bcd1ea2592974fb876d7b13c8a78a132beb616ae26e0344ceb534d77b1847012cb585a17fe2bdd93bee50edefcb9c4772029d5a2f26f59e')
[ "$CARCH" = "x86_64" ] && sha512sums=('ccf69a2f8bfebdec3485e7ce202f26cf65fe1c295a6738e4f1daeb6068af29c405b9afa6fb8abfc723836b584a69ca75015f9bfab4a3a3f0d2373bc7b5dd87c2')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
