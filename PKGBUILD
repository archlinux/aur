# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='gnunet'
pkgname='messenger-cli'
pkgver='0.1.0'
pkgrel=1
pkgdesc='A command line interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://${_framework}.org"
license=('AGPL')
depends=("${_framework}" 'libgnunetchat' 'ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('576ca9ea7db461122454bf4a3fcd719fcb6dad77b804dcdd2574238e4adb6779'
            'SKIP')
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
	make INSTALL_DIR="${pkgdir}/usr/" install
}

