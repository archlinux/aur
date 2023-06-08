# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=11.4.0
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
sha512sums=('5862306e78bb96565b2ac16eca565ecc843ea195e692a60aa5ffb9e004eeb6cebe233224f3aa3866d84e968e146877e1b665d42d5b5240dbc51b6361e23204f7')
[ "$CARCH" = "x86_64" ] && sha512sums=('3bd1ad36b74b2bcb8dcd8527328966b9f0dd2b89c0457166286dfd0d542aed1fecb785b497010783ef8ac2db5312aeb094d43591a1cdff6d064d62026a4c618b')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
