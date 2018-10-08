# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=striata-reader
pkgver=2.27
pkgrel=1
pkgdesc="Reader for encrypted emails"
url="http://www.striata.com/download-the-striata-reader.html"
arch=('x86_64')
license=('custom')
depends=('xdg-utils' 'python2')
provides=('striata')
source=(https://reader.striata.com/downloads/Linux/${pkgname}-${pkgver}-${pkgrel}-amd64.tar.gz)
sha256sums=('5371cee10a777ea80602b9fb5dcd874bfe54ccf5cc7cddfe132f313ca4681c1e')
install=striata-reader.install

package() {
	cd "${srcdir}/${pkgname}"
    chmod 755 usr usr/share
    cp -a usr ${pkgdir}
    sed -i -e 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/bin/striata-reader-gui.py"
}
