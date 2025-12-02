# Maintainer: Teamon <teamon9161@163.com>

pkgname=tea-wind-bin
_pkgname=wind
pkgver=25.3.2.11180
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

sha512sums=('28e042da30751c2080f3eefdc0b7d50c217c802e743854d466ce4dfc3fa9feec93980ee624281df52107cf86dbdfbc8917ead6973a7713494fb16599af748c24')

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
