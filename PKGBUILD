# Maintainer: JinguTech <xiuluo.android at gmail dot com>
# Contributor: Edison Ibañez <edison@opmbx.org>

pkgname=sqlectron-gui
pkgver=1.38.0
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

sha256sums=('17eb28d4f4e34f619471f71edc68de5768791549e3313295d98f4cd2a991b6ff')
package() {
	cd "${srcdir}"
	tar -xvf ${pkgname}-${pkgver}.pacman -C ${pkgdir}
	# Remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}
