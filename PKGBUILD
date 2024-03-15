# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.3.0
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
sha512sums=('7b92419c403292525c5ab827ef6a18adac9bc4b76b1297249b6fe0ef766d5ecbc02d43736341840c61d98f67ebc57ab81fa6a2fead2ddc7128893472e944ca20')
[ "$CARCH" = "x86_64" ] && sha512sums=('44e23e033219fe282122a917ea7395b220c27a686c1e1b82c0a15fa4b07d260dbf095983ef3e1895910c3cee5bfd5e930d6a90107f8cff43843ebd8220cda094')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
