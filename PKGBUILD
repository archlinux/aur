# Maintainer: Lyman Li <lymanrb@gmail.com>

pkgname=odpscmd
pkgver=0.36.0
pkgrel=1
pkgdesc="Alibaba Cloud MaxCompute(ODPS) Command Line Tool"
arch=('any')
url="http://odps.aliyun.com"
license=('APACHE')
depends=('java-runtime')
makedepends=('unzip')
source=("https://github.com/aliyun/aliyun-odps-console/releases/download/v${pkgver}/odpscmd_public.zip"
    odpscmd)
md5sums=('e4a6396d08b211faf48bc9b2c3876e09'
    'a94bb8679669e70a77aa0212ba8767c3')

build() {
    cd ${srcdir}
    myroot=root/opt/odpscmd
    mkdir -p $myroot
    unzip odpscmd_public.zip -d $myroot
    rm -rv $myroot/bin
    install -D -m0755 odpscmd root/usr/bin/odpscmd
}

package() {
    cd ${srcdir}/root
    cp -av * ${pkgdir}/
}
