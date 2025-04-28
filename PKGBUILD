# Maintainer: Anysets<anysets@qq.com>
pkgname=amber-ce-trixie
pkgver=13.8.1
pkgrel=1
pkgdesc="a container app packaging and distributing solution, based on Debian 13."
arch=('aarch64' 'x86_64' 'loong64')
url="https://gitee.com/amber-ce/amber-ce-trixie"
license=('unknown')
depends=('bubblewrap'
	'xdg-desktop-portal'
	'flatpak'
	'zenity'
	'gcc'
	'debootstrap'
	'procps-ng'
	'rsync')
makedepends=('dpkg')

install=amber-ce-trixie.install

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-ce-trixie/repository/archive/${pkgver}.tar.gz")
sha256sums=('9c0c692cf7f8d1e93b0f744ff43c9a42b43f37ba87edae92ef492776cababe15')

build() {
	cd ${srcdir}/amber-ce-trixie-${pkgver}
	mkdir -p pkg
	# build amber-ce-trixie
	cp -rf ${srcdir}/amber-ce-trixie-${pkgver}/src/* ${srcdir}/amber-ce-trixie-${pkgver}/pkg
	bash ${srcdir}/amber-ce-trixie-${pkgver}/build-pkg.sh pkg
}

package() {
	cp -rf ${srcdir}/amber-ce-trixie-${pkgver}/pkg/* ${pkgdir}/
}
