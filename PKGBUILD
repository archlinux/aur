# Maintainer: Teamon <teamon9161@163.com>

pkgname=tea-wind-bin
_pkgname=wind
pkgver=26.2.0.07030
pkgrel=1
pkgdesc="Wind financial terminal, 万得金融终端"
arch=("x86_64")
url="http://www.wind.com.cn"
license=("unknown")
depends=('libidn11' 'libxcrypt-compat' 'openssl-1.1')
provides=("$_pkgname")
install=wind-bin.install
pkgprefix="com.wind.wft-kylinV10SP1"
pkgsuffix="amd64.deb"
source=("https://d-cdn.wind.com.cn/windnet/linux/${pkgprefix}_${pkgsuffix}.zip")

sha512sums=('5e879ea2621700f6e6aa5be8b86e117f5a04b6c507c28e75bc18ec8545073453899de4057efc16b09cfb459c9838251dea9e47d2466eaa33f59f1aed90af502b')

prepare(){
    cd ${srcdir}
    unzip -o ${pkgprefix}_${pkgsuffix}.zip
    ar p "com.wind.wft_${pkgver}_${pkgsuffix}" data.tar.xz | tar xJf -

}
package(){

    cd $srcdir
    mkdir -p $pkgdir/opt
    cp -rf usr $pkgdir/

    mkdir -p ${pkgdir}/opt/apps
    cp -rf opt/apps/com.wind.wft   ${pkgdir}/opt/apps
    cp -rf usr/share/* ${pkgdir}/usr/share
}
