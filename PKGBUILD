# Maintainer: CupIvan <mail@cupivan.ru>

pkgname=tinydns
pkgver=0.3
pkgrel=1

pkgdesc='Tiny cache DNS server'
arch=('any')
url=https://github.com/CupIvan/${pkgname}

source=(https://github.com/CupIvan/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('ba79f85fd76464c9e2c060fbea021d72')
dir=${pkgname}-${pkgver}

#source=(git+https://github.com/CupIvan/${pkgname}.git)
#md5sums=('ba79f85fd76464c9e2c060fbea021d72')
#dir=${pkgname}

backup=(etc/${pkgname}.conf)

build() {
	cd ${srcdir}/${dir}
	make
}

package() {
	cd ${srcdir}/${dir}

	install -Dm755 ${pkgname}         ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
	install -Dm644 ${pkgname}.conf    ${pkgdir}/etc/${pkgname}.conf
}
