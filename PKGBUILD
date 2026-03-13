# Maintainer: SamuelHenrique
pkgname=bspwm-layout-manager
pkgver=0.9.0
pkgrel=1
pkgdesc="Save and restore bspwm desktop layouts with a rofi menu"
arch=('any')
url="https://github.com/SamuelHenriqueDeMoraisVitrio/bspwm-layout-manager"
license=('MIT')
depends=('python' 'bspwm' 'rofi' 'xorg-xprop' 'wmctrl' 'xdotool')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b1e465030049ec6c1897ed36ba5dd0ce14e3e502e2aa106643cc6e5af6b17b00')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 assets/blm.desktop "$pkgdir/usr/share/applications/blm.desktop"
}

