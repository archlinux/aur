# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>
pkgname=opera
pkgver=11.51
_buildver=1087
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
sha256sums=('e2da38a1775b59ebf09e3695505634a3df9655b8812e3b4fe3163d02488d4aad')
[ "$CARCH" = "x86_64" ] && sha256sums=('63a4fb2e480bd895384bfb8e2c8e71dc979354f0eb8423b552dc37089dc791ad')

build() {
	opera-${pkgver}-${_buildver}.${_arch}.linux/install --prefix /usr --repackage ${pkgdir}/usr
	install -D -m 644 ${pkgdir}/usr/share/${pkgname}/defaults/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

