# Maintainer: Nicolas Quiénot <niQo @ aur>
# Contributor: Martin Schrodt <martin@schrodt.org>
pkgname=nvme-cli
pkgver=1.3
pkgrel=1
pkgdesc="NVM-Express user space tooling for Linux"
arch=('i686' 'x86_64')
url="https://github.com/linux-nvme/nvme-cli"
license=('GPL')
depends=('systemd')
makedepends=('git')
conflicts=('nvme-cli-git')
source=("https://github.com/linux-nvme/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c8d013a1afeec969f25bea974229e9d6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install
}
