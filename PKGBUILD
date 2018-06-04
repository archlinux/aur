# Maintainer: CupIvan <mail@cupivan.ru>

pkgname=tinydns
pkgver=0.2
pkgrel=1

pkgdesc='Tiny cache DNS server'
arch=('any')
url=https://github.com/CupIvan/${pkgname}

source=(https://github.com/CupIvan/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('226dbdf8d1c808c6b79b1e3cb14a352f')
dir=${pkgname}-${pkgver}

#source=(git+https://github.com/CupIvan/${pkgname}.git)
#md5sums=('226dbdf8d1c808c6b79b1e3cb14a352f')
#dir=${pkgname}

backup=(etc/${pkgname}.conf)

build() {
	cd ${srcdir}/${dir}
	./compile.sh
}

package() {
	cd ${srcdir}/${dir}

	install -Dm755 ${pkgname}         ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
	install -Dm644 ${pkgname}.conf    ${pkgdir}/etc/${pkgname}.conf
}
