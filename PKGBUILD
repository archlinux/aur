# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>
pkgname=rtl8723bs-git
_pkgname=rtl8723bs
pkgver=bd6f846
pkgrel=1
pkgdesc="RTL8723BS driver working on baytrail tablets"
url="https://github.com/muhviehstah/rtl8723bs"
arch=('i686' 'x86_64')
license=('GPL')
builddepends=('linux-headers')
source=("git+https://github.com/muhviehstah/rtl8723bs")
install=rtl8723bs.install
md5sums=('SKIP')


build() {
	
	cd "${srcdir}/${_pkgname}/"
	make all $MAKEFLAGS
}

package() {
	cd "${srcdir}/${_pkgname}/"
	_kver=$(uname -r)
	mkdir -p "${pkgdir}/lib/modules/${_kver}/kernel/drivers/net/wireless"
	install -p -m 644 8723bs.ko "${pkgdir}/lib/modules/${_kver}/kernel/drivers/net/wireless"
}

