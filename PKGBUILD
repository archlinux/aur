# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: Robert Booster <boosterdev at linuxmail dot org>

pkgname=zuki-themes
pkgver=3.36_3
pkgrel=1
pkgdesc="Zuki themes for GNOME, Xfce and more."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=(GPL3)
depends=(gtk-engine-murrine gtk-engines)
makedepends=(ninja meson sassc)
optdepends=(ttf-roboto)
conflicts=(zukitwo-themes-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lassekongo83/zuki-themes/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('aca7a05e1e8ad334ce5fba0c821fad2bcd4dd41b95d1ba3b059aa1762561409b')

build() {
    cd $pkgname-${pkgver//_/-}
    meson --prefix /usr --buildtype=plain build
    ninja -C build
}

package(){
    cd $pkgname-${pkgver//_/-}
    DESTDIR="$pkgdir" ninja -C build install
}
