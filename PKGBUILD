# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.2.0
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
sha512sums=('a8b3fbc305a29927a718218e00d31da4ea4af36a2c8f559ab7232abb465baf1631a8bd82ee54786be5891e02eeb6cfe3d53ea6c30e16c98c451c98f5053d957a')
[ "$CARCH" = "x86_64" ] && sha512sums=('383c742c49f993dc7176dc57bb33b674c792903f7e98da682ed58ce20adee9af4682569d7261d7690af75b3450ccdb952adf784102c6aaa5474b8646c65fb2cd')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
