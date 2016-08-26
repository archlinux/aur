# Maintainer: Heiher <r@hev.cc>

pkgname=ibus-table-zhengma
pkgver=1.4.4
pkgrel=2
pkgdesc="This is a ZhengMa table engine for IBus Table."
arch=("any")
url="http://code.google.com/p/ibus/"
license=('GPL-3')
depends=('ibus-table')
source=("git+git://github.com/heiher/ibus-table-zhengma.git#tag=$pkgver")
sha256sums=('SKIP')

build()
{
	cd ${pkgname}

	/usr/bin/ibus-table-createdb -n zhengma.db -s zhengma.txt
}

package()
{
	cd ${pkgname}

	install -d ${pkgdir}/usr/share/ibus-table/icons/
	install -d ${pkgdir}/usr/share/ibus-table/tables/
	install -m0644 zhengma.svg ${pkgdir}/usr/share/ibus-table/icons/
	install -m0644 zhengma.db ${pkgdir}/usr/share/ibus-table/tables/
}
