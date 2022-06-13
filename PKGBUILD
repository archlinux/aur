# Maintainer: wszqkzqk <wszqkzqk@qq.com>
pkgname=com.classin.deepin
pkgver=4.2.6.353deepin6
pkgrel=1
pkgdesc="Classin from deepin"
arch=('i686' 'x86_64')
url="https://www.classinpaas.com"
license=('')
depends=('deepin-wine6-stable' 'deepin-wine6-stable-i386' 'p7zip' 'deepin-wine-helper')
# install=pvz.install
source=(
"https://com-store-packages.uniontech.com/appstore/pool/appstore/c/com.classin.deepin/${pkgname}_${pkgver}_i386.deb")
md5sums=('75f951044f720d149f01c4fcd71d66a4')

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
    msg "Preparing icons ..."
	install -d usr/share
	chmod -Rf 755 opt
	chmod -Rf 755 usr
    chmod 777 opt/apps/${pkgname}
    chmod 777 opt/apps/${pkgname}/*
    mv opt/apps/${pkgname}/entries/* usr/share
    rm -r opt/apps/${pkgname}/entries
}
