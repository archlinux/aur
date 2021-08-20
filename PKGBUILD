# Maintainer: JinguTech <xiuluo.android at gmail dot com>
# Contributor: Edison Ibañez <edison@opmbx.org>

pkgname=sqlectron-gui
pkgver=1.37.1
pkgrel=1
pkgdesc="A simple and lightweight SQL client with cross database and platform support"
arch=('x86_64' 'i686')
url="https://sqlectron.github.io/"
license=('MIT')
depends=('electron')
case "$CARCH" in
	i686)    _arch=-i686;;
	x86_64)  _arch=;;
esac

source=(
	"${pkgname}-${pkgver}.pacman::https://github.com/sqlectron/sqlectron-gui/releases/download/v${pkgver}/sqlectron-${pkgver}${_arch}.pacman"
)

sha256sums=('c5c650e8de1d14a8ecc7e9af80f9f0fe32c1b33c40c7aa65dac693c3bfb6e00a')
package() {
	cd "${srcdir}"
	tar -xvf ${pkgname}-${pkgver}.pacman -C ${pkgdir}
	# Remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}
