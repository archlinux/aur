# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=lightfirefox
pkgver=44.0
_pkgver=44
pkgrel=1
pkgdesc="A light Firefox edition"
url="http://sourceforge.net/projects/lightfirefox"
license=('MPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gtk3' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
provides=("${pkgname}=${_pkgver}")
install=${pkgname}.install
arch=('i686' 'x86_64')
source_x86_64=("http://downloads.sourceforge.net/project/${pkgname}/${_pkgver}/${pkgname/firefox}-${pkgver}.en-US.linux-x86_64.rpm")
md5sums_x86_64=('9cc57ed1c36c49206f16cf2a63cd7cb6')

source_i686=("http://downloads.sourceforge.net/project/${pkgname}/${_pkgver}/${pkgname/firefox}-${pkgver}.en-US.linux-i686.rpm")
md5sums_i686=('e7f76fcfe6580d70ebc59c4317539693')

package()
{
	cd "${srcdir}/usr/local"

	mkdir -p "${pkgdir}/usr/bin"
	cp -Rv {lib,share}/ "${pkgdir}/usr"
	ln -s /usr/lib/light/light "${pkgdir}/usr/bin/light"
}
