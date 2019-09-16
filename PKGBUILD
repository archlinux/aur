# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_projname='NExtGen'
pkgname="${_projname,,}"
pkgver='0.1.1'
pkgrel=1
pkgdesc="A small bash script that lets you easily set up a new extension project for GNOME's Nautilus file manager"
arch=('any')
url="https://github.com/madmurphy/${_projname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://github.com/madmurphy/${_projname}/archive/${pkgver}.tar.gz")
sha256sums=('ee465e268e915376bc49fd099607e10fa7a98937c51678b00fc459bb63d26790')

package() {

	cd "${srcdir}/${_projname}-${pkgver}"

	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

	cp -a "${srcdir}/${_projname}-${pkgver}"/* "${pkgdir}/usr/share/${pkgname}"
	mv "${pkgdir}/usr/share/${pkgname}"/{COPYING,README.md,ChangeLog.md} "${pkgdir}/usr/share/doc/${pkgname}/"
	rm -f "${pkgdir}/usr/share/${pkgname}/package.json"
	ln -s "/usr/share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}

