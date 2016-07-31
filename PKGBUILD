# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=6.0.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('13c93e2eabc715558b836d9be4b07ed487d29a8e88d5a9e7852139376dd60e98ec2127efc20a3d8b8b7728567714125bf18e185f00332f791c6d60ec0cea6b4d')
[ "$CARCH" = "x86_64" ] && sha512sums=('98b631e6ef6a00cbcd44b7721ff6d25efb0e68e65cc129ee3fd3fe8beac267f456d2e1398a28033994c6a948870944b0b5c38d4ee3bc89317f80460a03c1b750')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
