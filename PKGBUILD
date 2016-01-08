# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.4.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('0089ca62dd3f45833ac7fddfc58ba511896481ccca650b3816b5917090c072651599e9ce4c340f3a917f00ed3d4a2d611bb19799483aefda35ae17448257848a')
[ "$CARCH" = "x86_64" ] && sha512sums=('bb7c4cc55a991245a478fa26e6584f0021e266d9b1a3b7bec5e94bb24e3952c1b0c9a925dd39dcc86826c62f6a0f883ce82424a26080b38526e1e8fcbe684320')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
