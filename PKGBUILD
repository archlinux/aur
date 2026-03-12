# Maintainer: samuelh
pkgname=bspwm-layout-manager
pkgver=0.1.0
pkgrel=1
pkgdesc="Save and restore bspwm desktop layouts with a rofi menu"
arch=('any')
url="https://github.com/SamuelHenriqueDeMoraisVitrio/bspwm-layout-manager"
license=('MIT')
depends=('python' 'bspwm' 'rofi' 'xorg-xprop')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8b2752d17f8061e60176c69661227721a3690ba0fd9c7a40632996ea8efc5e41')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 assets/blm.desktop "$pkgdir/usr/share/applications/blm.desktop"
}

