# Maintainer: Lyman Li <lymanrb@gmail.com>

pkgname=odpscmd
pkgver=0.35.1
pkgrel=1
pkgdesc="Aliyun ODPS Command Line Tool"
arch=('any')
url="http://odps.aliyun.com"
license=('APACHE')
depends=('java-runtime')
makedepends=('unzip')
source=("https://github.com/aliyun/aliyun-odps-console/releases/download/v${pkgver}/odpscmd_public.zip"
    odpscmd)
md5sums=('63af51bebfde31efcef48e5dbe937489'
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
