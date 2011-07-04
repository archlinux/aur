# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>
pkgname=opera
pkgver=11.50
_buildver=1074
pkgrel=1
pkgdesc="A fast and secure web browser and Internet suite."
url="http://www.opera.com/browser/"
depends=('gcc-libs' 'libxt' 'freetype2' 'libxext')
optdepends=('gtk2: GTK integration'
	    'kdebase-runtime: KDE4 integration'
	    'gstreamer0.10-base-plugins: HTML5 open codecs support'
	    'gstreamer0.10-good: HTML5 open codecs support'
	    'gstreamer0.10-ffmpeg: HTML5 not so open codecs support'
	    'gstreamer0.10-bad-plugins: HTML5 not so open codecs support')
install=${pkgname}.install
options=(!strip !zipman)
license=('custom:opera')
arch=('i686' 'x86_64')
_arch=i386
[ "$CARCH" = "x86_64" ] && _arch=x86_64
source=(http://ftp.opera.com/pub/opera/linux/${pkgver/./}/opera-${pkgver}-${_buildver}.${_arch}.linux.tar.xz)
sha256sums=('d936881411db5cca320e3eb4b921d0f99a32c5bb100278183533be0e8fda8f86')
[ "$CARCH" = "x86_64" ] && sha256sums=('17681e7f6e01fba6c29c3ca1474e7df779a0b5db1834a334557fafbafa5cc753')

build() {
	opera-${pkgver}-${_buildver}.${_arch}.linux/install --prefix /usr --repackage ${pkgdir}/usr
	install -D -m 644 ${pkgdir}/usr/share/${pkgname}/defaults/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

