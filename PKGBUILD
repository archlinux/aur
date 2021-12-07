# Maintainer: duapple <2832893880@qq.com>

pkgname=appstart
pkgver=0.1.0
pkgrel=1
pkgdesc="app batch start up"
arch=('x86_64')
url="https://gitee.com/duapple/go_projects"
license=('unknow')
depends=()
makedepends=("git")
optdepends=()
source=("https://gitee.com/duapple/go_projects/attach_files/905085/download/appstart"
        "https://gitee.com/duapple/go_projects/attach_files/905110/download/AppInfo.json")
noextract=()
md5sums=("1e2085c2279a0f2ca84eece9d0d53a9b" "061e319a6a66affc7fe345ddb38ad68c")

prepare() {
    rm -rf ${pkgname}-${pkgver}
    mkdir -p ${pkgname}-${pkgver}
    mv ${pkgname} ${pkgname}-${pkgver}
    mv AppInfo.json ${pkgname}-${pkgver}
}

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}/  
    mkdir -p ${pkgdir}/usr/share/${pkgname}/config
    cd ${pkgname}-${pkgver}
    install -Dm777 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    cp AppInfo.json ${pkgdir}/usr/share/${pkgname}/config/
}