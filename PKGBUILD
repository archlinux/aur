# Maintainer: va2bbw <antelaurijssen@gmail.com>
# Last updated 2026-08-22

pkgname=paracon
pkgver=1.3.0
pkgrel=2
pkgdesc="Paracon is a packet radio terminal for Linux, Mac and Windows."
arch=('any')
url="https://github.com/mfncooper/paracon"
license=('MIT')
depends=('python>=3.9')
makedepends=('python-pip')
provides=("$pkgname")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db1d629e2f2cd352412fdd9fd753f2f9ff9303ad01791cd1d04ba97144cff5fa')

build() {
    cd "$pkgname-$pkgver"
    ./build_zipapp.sh
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "${pkgname}"_*.pyz "$pkgdir/usr/bin/paracon"
}
