# Maintainer: Lyman Li <lymanrb@gmail.com>

pkgname=odpscmd
pkgver=0.43.2
pkgrel=1
pkgdesc="Alibaba Cloud MaxCompute(ODPS) Command Line Tool"
arch=('any')
url="http://odps.aliyun.com"
license=('APACHE')
depends=('java-runtime')
makedepends=('unzip')
source=("https://github.com/aliyun/aliyun-odps-console/releases/download/v${pkgver}/odpscmd_public.zip"
    odpscmd)
md5sums=('908fffc083720ae613617af3ea3f91d9'
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
