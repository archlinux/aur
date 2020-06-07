# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='xfce4-alsa-plugin'
pkgver=0.3.0
pkgrel=1
pkgdesc='Simple ALSA volume control for xfce4-panel'
url='https://github.com/equeim/xfce4-alsa-plugin'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('alsa-lib' 'xfce4-panel')
makedepends=('vala' 'gettext' 'meson')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('e7c6aa6e65ce70764f2b8815445dd4be16f2c8aeee4971e9d7e1c66a44db7bbe')

build() {
        arch-meson "${pkgname}-${pkgver}" build
        meson compile -C build
}

package() {
        DESTDIR="${pkgdir}" meson install -C build
}
