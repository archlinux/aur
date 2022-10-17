# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=vivictpp
pkgdesc='An easy to use tool for subjective comparison of the visual quality of different encodings of the same video source.'
pkgver=0.2.3
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64')
url='https://github.com/svt/vivictpp'
license=('GPL2')
depends=('sdl2_ttf'
         'ffmpeg')
makedepends=('cmake'
             'meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/svt/vivictpp/archive/refs/tags/v${pkgver}.zip")
sha256sums=('1b00feca8f2d699092ab3d8e068062d4cf081b7006801e8b1aa37ff94681cd27')

build() {
    meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname}-${pkgver}" "builddir"
    meson compile -C builddir
}

package() {
    meson install -C builddir --destdir "$pkgdir"
}
