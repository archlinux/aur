# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='xfce4-alsa-plugin'
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple ALSA volume control for xfce4-panel'
url='https://github.com/equeim/xfce4-alsa-plugin'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('alsa-lib' 'xfce4-panel')
makedepends=('vala' 'gettext' 'meson')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('16971c3c7d6324238db98c210da17755f27bc5baa080feae22f11005164ac3e2')

build() {
        arch-meson "${pkgname}-${pkgver}" build
        meson compile -C build
}

package() {
        DESTDIR="${pkgdir}" meson install -C build
}
