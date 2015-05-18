# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=lightfirefox
pkgver=38.0
pkgrel=1
pkgdesc="A light Firefox edition"
url="http://sourceforge.net/projects/lightfirefox"
license=('MPL')
makedepends=('rpmextract')
depends=('gtk2' 'desktop-file-utils' 'nss' 'libxt' 'dbus-glib' 'alsa-lib')
install=${pkgname}.install
arch=('i686' 'x86_64')
source=("http://cznic.dl.sourceforge.net/project/${pkgname}/${pkgver/.0}/${pkgname/firefox}-${pkgver}.en-US.linux-${CARCH}.rpm")
md5sums=('15ddd9e80e162917474313496d195ac7')

build()
{
	cd "${srcdir}"
	rpmextract.sh *.rpm
}

package()
{
	cd "${srcdir}/usr/local"

	mkdir -p "${pkgdir}/usr/bin"
	cp -Rv {lib,share}/ "${pkgdir}/usr"
	ln -s /usr/lib/light/light "${pkgdir}/usr/bin/light"
}
