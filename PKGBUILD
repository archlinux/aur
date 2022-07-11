# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.4.1
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
sha512sums=('5223703d90a4ccba7f5f9983665518eadea119b0724fad8d66e5a957582fdd117f72514e3b8fada7387720a0d16bb3ea9e89fc02e7c1ca3e95b08c87d64481e7')
[ "$CARCH" = "x86_64" ] && sha512sums=('047fdf626650542a6b2ff2cea91086b0dfc82fe77b247583ac6052246167a3bb8b83a747b2c899ffafb910a71a4f343fab9e498288100a28ef2802c9b6b0d9f5')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
