# Maintainer: Nicolas Quiénot <niQo @ aur>
# Contributor: Martin Schrodt <martin@schrodt.org>
pkgname=nvme-cli
pkgver=0.9
pkgrel=1
pkgdesc="NVM-Express user space tooling for Linux"
arch=('i686' 'x86_64')
url="https://github.com/linux-nvme/nvme-cli"
license=('GPL')
depends=('systemd')
makedepends=('git')
conflicts=('nvme-cli-git')
source=("https://github.com/linux-nvme/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('1cd64583094ef65c252564763397e8e8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install
}
