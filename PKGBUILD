# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=11.4.1
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
sha512sums=('399eceedeab1292081a2b19caf674db65ac8f525fc49ec1ac8f8b17618b078f743b20afe8fd9b8585d8c0b2076f30eab49aa29b6221e82a6536e55df8c8cc661')
[ "$CARCH" = "x86_64" ] && sha512sums=('7dd705bcb8b01c7ea56f73c42efe924cac5ec904b8ffdeb4ba9a8f7ce06d2afbf702fdb6fb916f190f8a54c59ab389610a7a9b575ab72614e36d49c8094427ed')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
