# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.2.4
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('f537f3ce2dea35537745d1859da4ec0ecbce5d1a16c529e65d9e1db7d81267fbc148afe916a5ae70919be5916ff06626ef2833f84a776b4dd0832293ebe97c6b')
[ "$CARCH" = "x86_64" ] && sha512sums=('f1d772237dc75526236fe15dff7a4e4b3c89e075707b75abc9955a04fd3897215507ba7ca23595828830002236693d1d906a028383a1fabbbdf91ecdd26ce039')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
