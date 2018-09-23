# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='xfce4-alsa-plugin'
pkgver=0.1.2
pkgrel=1
pkgdesc='Simple ALSA volume control for xfce4-panel'
url='https://github.com/equeim/xfce4-alsa-plugin'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('alsa-lib' 'xfce4-panel')
makedepends=('vala' 'gettext' 'meson')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('2ae44ad8b94d8a889f7c33d251b9e61bc987cdd857fd140124499b0caf3fb643')

build() {
        arch-meson "${pkgname}-${pkgver}" build
        ninja -C build
}

package() {
        DESTDIR="${pkgdir}" meson install -C build
}
