# Contributor: Boian Bonev <bbonev@ipacct.com>
# Maintainer: Boian Bonev <bbonev@ipacct.com>

pkgname=bpfmon
pkgver=2.51
pkgrel=1
pkgdesc="BPF based visual packet rate monitor"
arch=('any')
url="https://github.com/bbonev/bpfmon"
license=('GPL2')
depends=('glibc' 'libyascreen.so')
source=("${url}/releases/download/v${pkgver}/bpfmon-${pkgver}.tar.xz" "${url}/releases/download/v${pkgver}/bpfmon-${pkgver}.tar.xz.asc")
validpgpkeys=('BA60BC20F37E59444D6D25001365720913D2F22D')
md5sums=('SKIP' 'SKIP')

package() {
	cd bpfmon-${pkgver}
	sed -i 's/sbin/bin/g' Makefile
	make PREFIX=/usr INSTALL=install DESTDIR="${pkgdir}" V=1 install
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
