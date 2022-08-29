# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=vivictpp
pkgdesc='An easy to use tool for subjective comparison of the visual quality of different encodings of the same video source.'
pkgver=0.2.0
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64')
url='https://github.com/svt/vivictpp'
license=('GPL2')
depends=('ffmpeg'
         'sdl_image'
         'freetype2')
makedepends=('meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/svt/vivictpp/archive/refs/tags/v${pkgver}.zip")
sha256sums=('348b213245d0d29b71a600f7b75ea3f0c487836dfb423f954e0ac3cce3cbad58')

build() {
    meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname}-${pkgver}" "builddir"
    meson compile -C builddir
}

package() {
    meson install -C builddir --destdir "$pkgdir"
}
