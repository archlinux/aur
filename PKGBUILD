# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_projname='NExtGen'
pkgname="${_projname,,}"
pkgver='0.1.2'
pkgrel=1
pkgdesc="A small bash script that lets you easily set up a new extension project for GNOME's Nautilus file manager"
arch=('any')
url="https://github.com/madmurphy/${_projname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://github.com/madmurphy/${_projname}/archive/${pkgver}.tar.gz")
sha256sums=('ae6c7419930c2af8aa29886b0f616693e51012dc0c728b82ef7bfa6e51ce9b02')

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

