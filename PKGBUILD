# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.7.2
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('a208a8c102fd0ca2ddde1f69e9391473c4218315f064fe0079951cec00afe4d96eb7decf23db6a885ebf2fb44e92b011babfa7ca058c3fc38b0f0484614d1c75')
[ "$CARCH" = "x86_64" ] && sha512sums=('6b2be21310ead96bf7cad3ec2b90938745e85bff349b831579ab7ff1f2fc9f5d62eacdba05c5a5f69be145444773d70941af41af1b7ce95037e82cd02dea3578')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
