# Maintainer: Anysets<anysets@qq.com>
pkgname=amber-ce-bookworm
pkgver=12.7.5
pkgrel=1
pkgdesc="a container app packaging and distributing solution."
arch=('aarch64' 'x86_64' 'loong64')
url="https://gitee.com/amber-ce/amber-ce-bookworm"
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

install=amber-ce-bookworm.install

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-ce-bookworm/repository/archive/${pkgver}.tar.gz")
sha256sums=('7eeb558f6c8d5a2129a83721a2fc9a5b297c3a08e626b53617c8bbfd3db8b00f')

build() {
	cd ${srcdir}/amber-ce-bookworm-${pkgver}
	mkdir -p pkg
	# build amber-ce-bookworm
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}/src/* ${srcdir}/amber-ce-bookworm-${pkgver}/pkg
	bash ${srcdir}/amber-ce-bookworm-${pkgver}/build-pkg.sh pkg
}

package() {
	cp -rf ${srcdir}/amber-ce-bookworm-${pkgver}/pkg/* ${pkgdir}/
}
