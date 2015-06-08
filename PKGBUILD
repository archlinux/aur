# Maintainer: Dea1993 <andrea.deangelis93@gmail.com>

pkgname=conky-dea
pkgver=1.2
pkgrel=2
pkgdesc="A conky-lua theme for 4 core CPU's"
arch=('any')
url="http://deasproject.altervista.org/blog/il-mio-tema-conky-approda-aur/"
license=('GPL')
depends=('conky-lua' 'lm_sensors')
source=("conky-dea-${pkgver}.tar.gz"::"http://sourceforge.net/projects/conky-lua/files/conky-dea-${pkgver}.tar.gz/download")
md5sums=('3e3d54eddbdb2e89f11bf28d1e236b62')

package() {
	cd "${srcdir}/conky-dea-${pkgver}"

	install -m 755 -d "${pkgdir}/etc/conky/"
	install -m 644 -t "${pkgdir}/etc/conky/" "conky-dea.conf"
	
	install -m 755 -d "${pkgdir}/usr/share/${pkgname}/ConkyLua"
	install -m 644 -t "${pkgdir}/usr/share/${pkgname}/ConkyLua" ConkyLua/*
	
	install -m 755 -d "${pkgdir}/usr/bin/"
	install -m 755 -t "${pkgdir}/usr/bin/" "conky-dea"
} 