# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=striata-reader
pkgver=2.25
pkgrel=3
pkgdesc="Reader for encrypted emails"
url="http://www.striata.com/download-the-striata-reader.html"
arch=('x86_64')
license=('custom')
depends=('xdg-utils' 'python2')
provides=('striata')
source=(https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-${pkgrel}-amd64.tar.gz)
sha256sums=('3100c697bd9f4d07aebfa293fcc7b889653e29a56cc67d87191beab191f8eae0')
install=striata-reader.install

package() {
	cd "${srcdir}/${pkgname}"
    chmod 755 usr usr/share
    cp -a usr ${pkgdir}
    sed -i -e 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/bin/striata-reader-gui.py"
}
