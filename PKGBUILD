# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=9.4.0
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
sha512sums=('c7fa07224c588e6799100fa1da9db0ebb818a3edca303484dc09a252d17734b77126c8bdb45a9aa0a6ebbd000d85e64beee053771200f0c8536f6edf24b172b0')
[ "$CARCH" = "x86_64" ] && sha512sums=('244e0c5c6749a9f43bc8d04969d99ccca4ad629c742a1e7debeee81b7949caefd6bf708b607fb224b16adcdebaa8f85b53504180f99064b96d482380e9697946')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
