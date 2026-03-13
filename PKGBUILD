# Maintainer: SamuelHenrique
pkgname=bspwm-layout-manager
pkgver=0.3.0
pkgrel=1
pkgdesc="Save and restore bspwm desktop layouts with a rofi menu"
arch=('any')
url="https://github.com/SamuelHenriqueDeMoraisVitrio/bspwm-layout-manager"
license=('MIT')
depends=('python' 'bspwm' 'rofi' 'xorg-xprop')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7b7694793c02a756ee13d4fedff7b24e1088f39344da8f8ce5d490ab997a158f')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 assets/blm.desktop "$pkgdir/usr/share/applications/blm.desktop"
}

