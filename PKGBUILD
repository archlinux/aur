# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>
pkgname=opera
pkgver=11.52
_buildver=1100
pkgrel=1
pkgdesc="A fast and secure web browser and Internet suite."
url="http://www.opera.com/browser/"
depends=('gcc-libs' 'libxt' 'freetype2' 'libxext')
optdepends=('gstreamer0.10-base-plugins: HTML5 Video support' 'gstreamer0.10-good: HTML5 Video support')
install=${pkgname}.install
options=(!strip !zipman)
license=('custom:opera')
arch=('i686' 'x86_64')
_arch=i386
[ "$CARCH" = "x86_64" ] && _arch=x86_64
source=(http://ftp.opera.com/pub/opera/linux/${pkgver/./}/opera-${pkgver}-${_buildver}.${_arch}.linux.tar.xz)
sha256sums=('ccbfdcd0f9f5e35f64f6b71410b5af7b5e749f0976e530d1543d6cc58b989af9')
[ "$CARCH" = "x86_64" ] && sha256sums=('9880b91733eddc17b85edba3eef0fe96c7e6a8fb3cc8c802b3719307214cb7a5')

build() {
	opera-${pkgver}-${_buildver}.${_arch}.linux/install --prefix /usr --repackage ${pkgdir}/usr
	install -D -m 644 ${pkgdir}/usr/share/${pkgname}/defaults/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

