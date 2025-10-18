# Maintainer: va2bbw <antelaurijssen@gmail.com>

pkgname=paracon
pkgver=1.3.0
pkgrel=1
pkgdesc="Paracon is a packet radio terminal for Linux, Mac and Windows."
arch=('x86_64')
url="https://github.com/mfncooper/paracon"
license=('MIT')
depends=('python>=3.9')
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums_x86_64=('db1d629e2f2cd352412fdd9fd753f2f9ff9303ad01791cd1d04ba97144cff5fa')

build() {
    cd "$pkgname-$pkgver"
    ./build_zipapp.sh
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm 755 "${pkgname}_${pkgver}.pyz" "$pkgdir/usr/bin/paracon"
}


