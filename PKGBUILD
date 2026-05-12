# Maintainer: Frederick Price <fprice@pricemail.ca>
pkgname=volumepanning.lv2
pkgver=0.1.4
pkgrel=1
pkgdesc="Mono-to-stereo LV2 plugin with volume, pan, mute, and bypass controls"
arch=('x86_64' 'aarch64')
url="https://github.com/rickprice/VolumePanning.lv2"
license=('BSD-3-Clause')
makedepends=('lv2' 'gcc')
source=("VolumePanning.lv2-$pkgver.tar.gz::https://github.com/rickprice/VolumePanning.lv2/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6c2ea2c87bb8c4f333c24f1fabbe4543674516655b89490fdb89edc5c01cedf')

build() {
    cd "VolumePanning.lv2-$pkgver"
    make clean
    make
}

package() {
    cd "VolumePanning.lv2-$pkgver"
    make install INSTALL_DIR="$pkgdir/usr/lib/lv2/volumepanning.lv2"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
