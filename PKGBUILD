# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.8.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('8696eac9e52974cfaaaec8128ce53af93d47c4c89c84511a574405dff1a63824ff29fd98a51c377445cd2b89270c3ec0db037ebd2f5222b78f3e77ee73967889')
[ "$CARCH" = "x86_64" ] && sha512sums=('e68dee6efe20c3fd8988bf9ad00c1cb5b38adec1e993297e94481527e3be9220db3f5dedca95853df257364f869301ba63d6cbef7637591f54da642c8126ef71')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
