# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=striata-reader
pkgver=2.21
pkgrel=1
pkgdesc="Reader for encrypted emails"
url="http://www.striata.com/download-the-striata-reader.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('xdg-utils' 'python2')
provides=('striata')
source_i686=("https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-1.tar.gz")
sha256sums_i686=('51a526883b1272d52309ab86608b2bc749cee9cee483cc00d522329b526a8cdf')
source_x86_64=("https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-1-amd64.tar.gz")
sha256sums_x86_64=('4cc690b1fb2772d38b3e40a56dca77c45bb13efc8a36a545b2e7ff4467257c30')
install=striata-reader.install

package() {
	cd "${srcdir}/${pkgname}"
    chmod 755 usr usr/share
    cp -a usr ${pkgdir}
    sed -i -e 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/bin/striata-reader-gui.py"
}
