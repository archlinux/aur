# Maintainer: Teamon <teamon9161@163.com>

pkgname=tea-wind-bin
_pkgname=wind
pkgver=25.1.2.05281
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

sha512sums=('ef1d521e5646efd5647d7ad94db8fd339230a1420a886a285d6037f112adbd2d26334687143e2598d712703042fcfb3fdfd90def5296f3dc1a0c65923f922910')

prepare(){
    cd ${srcdir}
    unzip -o ${pkgprefix}_${pkgsuffix}.zip
    ar p "${pkgprefix}_${pkgver}_${pkgsuffix}" data.tar.xz | tar xJf -

}
package(){

    cd $srcdir
    mkdir -p $pkgdir/opt
    cp -rf usr $pkgdir/

    mkdir -p ${pkgdir}/opt/apps
    cp -rf opt/apps/com.wind.wft   ${pkgdir}/opt/apps
    cp -rf usr/share/* ${pkgdir}/usr/share
}
