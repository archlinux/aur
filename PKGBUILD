# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=striata-reader
pkgver=2.19
pkgrel=1
pkgdesc="Reader for encrypted emails"
url="http://www.striata.com/download-the-striata-reader.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('xdg-utils' 'python2')
provides=('striata')
source_i686=("https://reader.striata.com/downloads/linux32/${pkgname}-${pkgver}-1.tar.gz")
md5sums_i686=('e3691ae2d9633ce7ded7e917213bfc4f')
source_x86_64=("https://reader.striata.com/downloads/linux64/${pkgname}-${pkgver}-1-amd64.tar.gz")
md5sums_x86_64=('618aaa80ca84c8a84a06e086dce4356d')
install=striata-reader.install

package() {
	cd "${srcdir}/${pkgname}"
    chmod 755 usr usr/share
    cp -a usr ${pkgdir}
    sed -i -e 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/bin/striata-reader-gui.py"
}
