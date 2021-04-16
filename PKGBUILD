# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=com.officebox.spark
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Officebox client on Deepin Wine5. 万彩办公大师，办公必备的小工具百宝箱"
arch=('i686' 'x86_64')
url=""
license=('unknown')
groups=()
depends=('deepin-wine5' 'deepin-wine5-i386' 'deepin-wine5')
checkdepends=()
optdepends=()
provides=("spark")
conflicts=("spark")
replaces=("spark")
backup=()
options=()
install=com.officebox.spark.install
changelog=
source=(
"http://dcstore.spark-app.store/store/office/com.officebox.spark/com.officebox.spark_3.0.8.spark1_i386.deb")
md5sums=('aab3cc5453fcfca2c9857059a8ff55b8')

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}


package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
    install -m644 "${srcdir}/dpkgdir/opt/apps/${pkgname}/files/files.7z" "${pkgdir}/opt/apps/${pkgname}/files"
    msg "Preparing icons ..."
	install -d usr/share
	chmod -Rf 755 opt
	chmod -Rf 755 usr
    chmod 777 opt/apps/${pkgname}	
    chmod 777 opt/apps/${pkgname}/*
    mv opt/apps/${pkgname}/entries/* usr/share
    rm -r opt/apps/${pkgname}/entries
}
