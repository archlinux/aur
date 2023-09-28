# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.0.0
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
sha512sums=('5b9ee68167ef50124ecb0156796d9f9a5903857ccd4e3040dce911de751d57b0e0ac9718fb295f3569b4ae86b72a13f793ff5fb2a2f7efe50f051c4ce9150a3e')
[ "$CARCH" = "x86_64" ] && sha512sums=('63916f6d27a6f52689b281eb1db3690f5bd34155f992779199ebd9f712bbc20785747f0e1f373369199c773b7ff4e8f9ff098f358a1a9d7b8e8de7acbd85cffb')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
