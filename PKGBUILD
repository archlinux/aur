# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='xfce4-alsa-plugin'
pkgver=0.2.0
pkgrel=1
pkgdesc='Simple ALSA volume control for xfce4-panel'
url='https://github.com/equeim/xfce4-alsa-plugin'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('alsa-lib' 'xfce4-panel')
makedepends=('vala' 'gettext' 'meson')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('dba725eaca4ef9e44096b778d7e534bb2d0ff799f17f9ae9b8ff95e84b4fb94b')

build() {
        arch-meson "${pkgname}-${pkgver}" build
        ninja -C build
}

package() {
        DESTDIR="${pkgdir}" meson install -C build
}
