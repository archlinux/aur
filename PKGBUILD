# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=com.sanguozhipk.spark
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="三国志威力加强版 SanGuoZhiPK on Wine (from Spark Store)"
arch=('i686' 'x86_64')
url=""
license=('unknown')
groups=()
depends=('wine')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=sanguozhi.install
changelog=
source=(
"http://dcstore.spark-app.store/store/games/com.sanguozhipk.spark/com.sanguozhipk.spark_1.0spark0_i386.deb")
md5sums=(
'8a54c33c766a9208db7bfc470e4ece55'
)

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}


package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
    install -m644 "${srcdir}/dpkgdir/opt/apps/com.sanguozhipk.spark/files/files.7z" "${pkgdir}/opt/apps/com.sanguozhipk.spark/files"
    msg "Preparing icons ..."
    sed -i 's/TIM.exe/tim.exe/' opt/apps/${pkgname}/entries/applications/com.sanguozhipk.spark.desktop
	install -d usr/share
	chmod -Rf 755 opt
	chmod -Rf 755 usr
    chmod 777 opt/apps/com.sanguozhipk.spark	
    chmod 777 opt/apps/com.sanguozhipk.spark/*
    mv opt/apps/${pkgname}/entries/* usr/share
}
