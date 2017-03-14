# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=striata-reader
pkgver=2.23
pkgrel=2
pkgdesc="Reader for encrypted emails"
url="http://www.striata.com/download-the-striata-reader.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('xdg-utils' 'python2')
provides=('striata')
source_i686=("https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha256sums_i686=('30b007e4ecd3e76ce2e6dde5db0ff52c60ad6114abadbaa1f3f985c141c523b6')
source_x86_64=("https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-${pkgrel}-amd64.tar.gz")
sha256sums_x86_64=('029d6ca71712a24654dba9cefc8200b999bd9404f40de8971808e1e1bd4e7d2e')
install=striata-reader.install

package() {
	cd "${srcdir}/${pkgname}"
    chmod 755 usr usr/share
    cp -a usr ${pkgdir}
    sed -i -e 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/bin/striata-reader-gui.py"
}
