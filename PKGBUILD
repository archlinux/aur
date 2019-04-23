# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.10.4
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('b02ec1f56120beb7b4a8aac6ee5f102e11a54b0c8fdbb2140606286a198db46246268b4fbc90dcbe76d96dba25455b362affdb53d9c1a8b0549d63f789e37da1')
[ "$CARCH" = "x86_64" ] && sha512sums=('a46dd59cfaf5178dbe2885e264575c2cb9e3b88ee5e92de691a9ad87ec91009058920d887410a43aa12cf49a6c3104aad79a0dc7ad743dd5753ba3b6b9315096')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
