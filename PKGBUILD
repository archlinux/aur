# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=11.2.2
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('c0087fcbd0c4da7318017cc04bc7d896b7d24e2dcdcb01c0a8b3d02cc7166b0f9e136b1c017aa72f84576539be95206fe66a661b70d75d36b59357f0bc3e6803')
[ "$CARCH" = "x86_64" ] && sha512sums=('e80c75651d55038ec5b03b6b54f39f89f3b2d8f6e7fe36b33b33303aa45e66f050b08541bc50f9c84a155e09ca5ebe38b79a5e7bee7a5c241fb18705b98d2ec5')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
