# Maintainer: Teamon <teamon9161@163.com>

pkgname=tea-wind-bin
_pkgname=wind
pkgver=26.1.0.04151
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

sha512sums=('9e43939849a49cad32c7bbd284b05fef66eaa9ba3ec1d5f829c6628c5a9d2682e4df64e5743ebdaef6b8c5b325ba4342082e9a88bd5ff5984574d92edd044d64')

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
