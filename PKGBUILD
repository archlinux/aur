# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.3.12
pkgrel=2
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
url='https://github.com/polychromatic/polychromatic'
license=('GPL3')
depends=('python' 'hicolor-icon-theme' 'python-openrazer' 'webkit2gtk' 'libappindicator-gtk3' 'imagemagick')
makedepends=('nodejs-less')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/polychromatic/polychromatic/archive/v$pkgver.tar.gz"
        "0001-Migrate-platform-module-to-distro-v0.3.12.patch")
sha512sums=('e4099408f1543436ac8d1145f34631af59086542ba16c1f7b729f422d6555f5ce0ecfa0b49917cf73c88a0bf2467684001242b230833e994fa8c164c43fdad52'
            'a73552e795ad3c418b478f6ee203cb301f059319f07f630371f7f218a64e4efd9ca2173f1b4aa4f5cbfd41f7a37b996ec7ae91644d2fa2c484802138cb577766')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < ../0001-Migrate-platform-module-to-distro-v0.3.12.patch
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
