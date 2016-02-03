# Maintainer: Lyman Li <lymanrb@gmail.com>

pkgname=odpscmd
pkgver=0.20.0
pkgrel=1
pkgdesc="Aliyun ODPS Command Line Tool"
arch=('any')
url="http://odps.aliyun.com"
license=('APACHE')
depends=('java-runtime')
makedepends=('unzip')
source=("https://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/cn/odps/0.0.81/assets/download/odpscmd_public.zip"
    odpscmd)
md5sums=('17687cb46fa4cfd441956b8fe4ed634b'
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
