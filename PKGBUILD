# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=spark-store-submitter
reponame=dcs-submitter
pkgver=1.5.4.8
pkgrel=1
pkgdesc="社区商店投稿器 Origin By 乾一巽五"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'riscv64')
url="https://gitee.com/deepin-community-store/dcs-submitter"
license=('GPL3')
makedepends=('cmake' 'make' 'gcc' 'qt6-base')

source=("${reponame}-v${pkgver}.tar.gz::${url}/repository/archive/v${pkgver}.tar.gz")

sha512sums=('12932f548d52cd1ee46bbadeae1f530826203d6e1c3130d21f0b39a0c0e0bdaa404041d657d9fc13cd4beccb3e08492ef176edd3ad46bf40b547076c88abc0ac')

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
