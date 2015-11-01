# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.2.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('326ba6e863e30a69935afe5801b440e119a46de1081d565f63e5089f9ef6b47d6694ee7928b0d8bcbc8d9d50649182c45c68668a4a8dbd4a1dc3e604bacc335b')
[ "$CARCH" = "x86_64" ] && sha512sums=('704373e521049f35fb2d9721207561f05e1ff4a4a8af6f6e2189ab0fa21438f533eb41bbe5a5e81e100cb4bc73da97cf894472e1325d3960f3bbcf494bdb1f87')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
