# Maintainer: JinguTech <xiuluo.android at gmail dot com>
# Contributor: Edison Ibañez <edison@opmbx.org>

pkgname=sqlectron-gui
pkgver=1.36.0
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

sha256sums=('13c91f0ab6e72217be221d5f61f5e277f0c3d01c2cc23011c46426c898593c24')
package() {
	cd "${srcdir}"
	tar -xvf ${pkgname}-${pkgver}.pacman -C ${pkgdir}
	# Remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}
