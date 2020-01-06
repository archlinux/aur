# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='xfce4-alsa-plugin'
pkgver=0.2.1
pkgrel=1
pkgdesc='Simple ALSA volume control for xfce4-panel'
url='https://github.com/equeim/xfce4-alsa-plugin'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('alsa-lib' 'xfce4-panel')
makedepends=('vala' 'gettext' 'meson')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('09605eacb40c2f22b3c9b92440f705e54fb79be5c9319a467d40d378f17ce2d4')

build() {
        arch-meson "${pkgname}-${pkgver}" build -Dgtk3=true
        ninja -C build
}

package() {
        DESTDIR="${pkgdir}" meson install -C build
}
