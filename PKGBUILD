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
sha256sums=('b23f7e89172b92bfd8eb9bd721a8a2d1a822002181c42da858158490fab33fee')

package() {

	cd "${srcdir}/${_projname}-${pkgver}"

	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

	cp -a "${srcdir}/${_projname}-${pkgver}"/* "${pkgdir}/usr/share/${pkgname}"
	mv "${pkgdir}/usr/share/${pkgname}"/{COPYING,README.md} "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -s "/usr/share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

}

