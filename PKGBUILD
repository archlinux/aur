# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=spark-store-submitter
reponame=dcs-submitter
pkgver=1.5.4.9
pkgrel=1
pkgdesc="星火应用商店社区投稿器 Origin By 乾一巽五"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'riscv64')
url="https://gitee.com/deepin-community-store/dcs-submitter"
license=('GPL3')
makedepends=('cmake' 'make' 'gcc' 'qt6-base')

source=("${reponame}-v${pkgver}.tar.gz::${url}/repository/archive/v${pkgver}.tar.gz")

sha512sums=('3632ac8af927c9ee7a1970de54b87b0be22a39ab1355d22e4b9f7f8991304f86c215fa25d7b3ff58d1acd2bda48873f063be63ee3ad41b9012e9489a6ea86e6a')

build(){
    cd $srcdir/${reponame}-v${pkgver}
    make release
}
package() {
    install -Dm644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    cd $srcdir/${reponame}-v${pkgver}
    install -Dm755 ./build/$pkgname $pkgdir/usr/bin/$pkgname
    install -Dm644 ./images/icon.png $pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png
}
