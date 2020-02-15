# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.2.2
pkgrel=0
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('51e708f4d7056d7a3c1732eb85be371a54c08fe710e7514a2df78e315bd8827c17eb8ac3dbaffcbc012e92ce3f56f643a8477af0c01b3a25761ce1282bcdeabc')
[ "$CARCH" = "x86_64" ] && sha512sums=('3a37074924b27710b42d1f231c4228996f0cad3e90887ae98b2d26799a6ed2a96890614f50f3302404de7248e997926fe4954319fa32bf9cf3b19cbc056e2d31')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
