# Maintainer: va2bbw <antelaurijssen@gmail.com>

pkgname=paracon
pkgver=1.2.0
pkgrel=1
pkgdesc="Paracon is a packet radio terminal for Linux, Mac and Windows."
arch=('x86_64')
url="https://github.com/mfncooper/paracon"
license=('MIT')
depends=('python>=3.7')
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums_x86_64=('a8d7f6489fb3ea904b7724ab044b9092c4a348b08574ab2a7cfae50149f91a54')

build() {
    cd "$pkgname-$pkgver"
    ./build_zipapp.sh
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm 755 "${pkgname}_${pkgver}.pyz" "$pkgdir/usr/bin/paracon"
}


