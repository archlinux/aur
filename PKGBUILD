# Maintainer: SamuelHenrique
pkgname=bspwm-layout-manager
pkgver=0.4.0
pkgrel=1
pkgdesc="Save and restore bspwm desktop layouts with a rofi menu"
arch=('any')
url="https://github.com/SamuelHenriqueDeMoraisVitrio/bspwm-layout-manager"
license=('MIT')
depends=('python' 'bspwm' 'rofi' 'xorg-xprop')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d174e96a04f214b3868637945b5db51a51bd08e9e872c9c6ce04a78b4f6700a9')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 assets/blm.desktop "$pkgdir/usr/share/applications/blm.desktop"
}

