# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=11.4.5
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
sha512sums=('3657e12fdde86f5a79fad3c09a4c3b8d774233bb701572f9112261a181b7bea38e431f53f42f48ed33517446d9f5f202573c47d563e3fb22cccab7d5fab4d90d')
[ "$CARCH" = "x86_64" ] && sha512sums=('a0c549ec7cbd186af46dc25d6f093fce1e09e17844b94e230e5fb995185ac37e7d59695b6c50f7ac6b6d2d44d9f10938ac80890607e9079ccc2506c77a5ab314')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
