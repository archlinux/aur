# Maintainer: duapple <2832893880@qq.com>

pkgname=cformat
pkgver=0.1.0
pkgrel=1
pkgdesc="format C/C++ file"
arch=('x86_64')
url="https://gitee.com/duapple/go_projects/attach_files/904852/download/cformat"
license=('unknow')
depends=()
makedepends=("git")
optdepends=()
source=("https://gitee.com/duapple/go_projects/attach_files/904851/download/clang-format"
        "${url}"
        "https://gitee.com/duapple/go_projects/attach_files/904850/download/.clang-format")
noextract=()
md5sums=("ae1f245d659b0a180d483b4240f7ebd6" "6061ca24978dbd8dd50e7b03571c7111" "da2c17594374202bff1d26677c633176")

prepare() {
    rm -rf ${pkgname}-${pkgver}
    mkdir -p ${pkgname}-${pkgver}
    mv cformat ${pkgname}-${pkgver}
    mv clang-format ${pkgname}-${pkgver}
    mv .clang-format ${pkgname}-${pkgver}
}

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}/  
    mkdir -p ${pkgdir}/usr/share/${pkgname}/config
    mkdir -p ${pkgdir}/usr/share/${pkgname}/bin
    cd ${pkgname}-${pkgver}
    install -Dm777 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm777 clang-format ${pkgdir}/usr/share/${pkgname}/bin/
    cp .clang-format ${pkgdir}/usr/share/${pkgname}/config/
}