# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=striata-reader
pkgver=2.23
pkgrel=3
pkgdesc="Reader for encrypted emails"
url="http://www.striata.com/download-the-striata-reader.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('xdg-utils' 'python2')
provides=('striata')
source_i686=("https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-${pkgrel}.i386.tar.gz")
sha256sums_i686=('9b0f416660ff9b55679f2101cc661c0ed148bb3420a6289b5c0c8fbac8181823')
source_x86_64=("https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-${pkgrel}-amd64.tar.gz")
sha256sums_x86_64=('fd8e4547ce3361e661045a7cc4af47937ff70f997d6b7522b6baa7248354d556')
install=striata-reader.install

package() {
	cd "${srcdir}/${pkgname}"
    chmod 755 usr usr/share
    cp -a usr ${pkgdir}
    sed -i -e 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/bin/striata-reader-gui.py"
}
