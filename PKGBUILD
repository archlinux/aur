# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=striata-reader
pkgver=2.27
pkgrel=3
pkgdesc="Reader for encrypted emails"
url="http://www.striata.com/download-the-striata-reader.html"
arch=('x86_64')
license=('custom')
depends=('xdg-utils' 'python2')
provides=('striata')
source=(https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-${pkgrel}-amd64.tar.gz)
sha256sums=('2f878c843d6fc517bd02eba54d121c0d3dc13a0b551cb7cfe354a6ed8359a08b')
install=striata-reader.install

package() {
	cd "${srcdir}/${pkgname}"
    chmod 755 usr
    chmod -R 644 usr/share
    chmod -R ugo+X usr/share
    cp -a usr ${pkgdir}
    sed -i -e 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/bin/striata-reader-gui.py"
}
