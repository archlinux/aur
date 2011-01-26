# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>
pkgname=opera
pkgver=11.00
_buildver=1176
pkgrel=2
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
sha256sums=('c49a97d68569f63c543fd66a340c4719c0ea2fd5703c5b3f2ec0e4ff0dcb60ed')
[ "$CARCH" = "x86_64" ] && sha256sums=('5b3a9a1c5cf54e5e28313e8b0b4238857a166232674688e888ca9bf52e0a9aed')

build() {
	opera-${pkgver}-${_buildver}.${_arch}.linux/install --prefix /usr --repackage ${pkgdir}/usr
	install -D -m 644 ${pkgdir}/usr/share/${pkgname}/defaults/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

