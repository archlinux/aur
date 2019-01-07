# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.9.1
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('9de374ff22517e10f7ffbad9f90410b2b6e77ea14ee620f6cee2700592b2cf7085dc9bb6d9c7e047e3009e5bfdaed7a2bf7bba7dcc3f5ac7a7eb29b70572362d')
[ "$CARCH" = "x86_64" ] && sha512sums=('dbb893152f167a605d8599655d43894ea96d2bea89390ba37cb0763f4dad7d1dd2f53891b85aea3724f1c1e9af75169fcf1bd86b8694abdcb54eddfe7b58197b')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
