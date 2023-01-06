# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=vivictpp
pkgdesc='An easy to use tool for subjective comparison of the visual quality of different encodings of the same video source.'
pkgver=0.2.4
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64')
url='https://github.com/vivictorg/vivictpp'
license=('GPL2')
depends=('sdl2_ttf'
         'ffmpeg')
makedepends=('cmake'
             'meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/vivictorg/vivictpp/archive/refs/tags/v${pkgver}.zip")
sha256sums=('c05fdec2936c7e0b0d2c3447ffe700835abad359b6064cac60a524472b14d97c')

build() {
    meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname}-${pkgver}" "builddir"
    meson compile -C builddir
}

package() {
    meson install -C builddir --destdir "$pkgdir"
}
