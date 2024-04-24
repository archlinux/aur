# Maintainer: Wenger Binning <wengerbinning@gmail.com>

pkgname='wenger-toolchains'

pkgdesc='This is toolchain managerment tools'
url='https://github.com/wengerbinning/toolchains'
license=('GPL')
arch=('any')

pkgver='0.7'
pkgrel='0'

# backup=('etc/ipsec.conf' 'etc/ipsec.secrets' 'etc/pam.d/pluto')

install="toolchains.install"
# _srcdir="libreswan-${pkgver}"

source=(
	$pkgname-v$pkgver.tar.gz::https://github.com/wengerbinning/toolchains/archive/refs/tags/v${pkgver}.tar.gz#
)

sha256sums=(
	'SKIP'
)

pkgver() {
	printf '%s' "${pkgver%.r*}"
}

build() {
	echo "build"
}

package() {
	#
	install -d ${pkgdir}/usr/include/
	install -m 644 -t ${pkgdir}/usr/include/ ${srcdir}/toolchains-${pkgver}/include/environment.sh
	install -d ${pkgdir}/usr/include/awk
	install -m 664 -t ${pkgdir}/usr/include/awk ${srcdir}/toolchains-${pkgver}/include/awk/environment.awk

	#
	install -d ${pkgdir}/usr/bin
	install -m 755 ${srcdir}/toolchains-${pkgver}/toolchains.sh ${pkgdir}/usr/bin/toolchains
	install -m 755 ${srcdir}/toolchains-${pkgver}/application.sh ${pkgdir}/usr/bin/application
}
