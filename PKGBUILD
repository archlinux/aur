# Maintainer: SamuelHenrique
pkgname=bspwm-layout-manager
pkgver=0.8.0
pkgrel=1
pkgdesc="Save and restore bspwm desktop layouts with a rofi menu"
arch=('any')
url="https://github.com/SamuelHenriqueDeMoraisVitrio/bspwm-layout-manager"
license=('MIT')
depends=('python' 'bspwm' 'rofi' 'xorg-xprop')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d073beb2fae30595787528c87a8923159fd4b33a5bdf5619af734b84b3d4db76')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 assets/blm.desktop "$pkgdir/usr/share/applications/blm.desktop"
}

