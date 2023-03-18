# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=11.3.0
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
sha512sums=('9ecabb92f9aaab1231080547da381df4647b79e157b805b91397db9c4dc7b9269be828f3e9e326b92385fa651d260153e4370df9fb253330b06d2f689500e517')
[ "$CARCH" = "x86_64" ] && sha512sums=('d687a5f91bba3b81db25c79b06a15ba94224259c2e98430c51dcab478f96d38cc1c12243aeef4ff6c92be6b236c27094f14a2ac282fb9ec1f88c8caaf0bb3771')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
