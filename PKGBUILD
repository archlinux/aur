# Contributor: Boian Bonev <bbonev@ipacct.com>
# Maintainer: Boian Bonev <bbonev@ipacct.com>

pkgname=yascreen
pkgver=1.99
pkgrel=1
pkgdesc="Yet Another Screen Library (lib(n)curses alternative)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="https://github.com/bbonev/yascreen"
license=('GPL2')
depends=('glibc')
provides=('libyascreen' 'libyascreen.so' 'libyascreen.so.0')
source=("${url}/releases/download/v${pkgver}/yascreen-${pkgver}.tar.xz" "${url}/releases/download/v${pkgver}/yascreen-${pkgver}.tar.xz.asc")
validpgpkeys=('BA60BC20F37E59444D6D25001365720913D2F22D')
md5sums=('SKIP' 'SKIP')

package() {
	cd yascreen-${pkgver}
	sed -i 's/sbin/bin/g' Makefile
	make INSTALL="install --strip-program=true" PREFIX=/usr DESTDIR="${pkgdir}" V=1 install
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
