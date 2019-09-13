# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_projname='NExtGen'
pkgname="${_projname,,}"
pkgver='0.1.0'
pkgrel=1
pkgdesc="A small bash script that lets you easily set up a new extension project for GNOME's Nautilus file manager"
arch=('any')
url="https://github.com/madmurphy/${_projname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://github.com/madmurphy/${_projname}/archive/${pkgver}.tar.gz")
sha256sums=('482c4cacb723a9e14609fdafcf81f9b0f5733048cb28f2921a90a0d8fb295786')

package() {

	cd "${srcdir}/${_projname}-${pkgver}"

	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

	cp -a "${srcdir}/${_projname}-${pkgver}"/* "${pkgdir}/usr/share/${pkgname}"
	mv "${pkgdir}/usr/share/${pkgname}"/{COPYING,README.md} "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -s "${pkgdir}/usr/share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}

