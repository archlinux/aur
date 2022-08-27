# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.4.3
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
sha512sums=('7d9e421d0fad6755f1f2bad9124808f007492ba9f577fddaa054398b91347fa8844538c232a80fd103a4d533be2e313a1a45df8ac50d1f7cb0a68fc05ced4207')
[ "$CARCH" = "x86_64" ] && sha512sums=('157258e975d17151f73ac34173ea33f7c6ad986b188a0f183ff9a18b9689363088e19608e975c063c664820e824b559ea18213e00fecf00a462268940bb34beb')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
