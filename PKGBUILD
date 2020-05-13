# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: schard <mail at richard dash neumann period de>

pkgname='obs-gnome-screencast'
pkgver='0.1.1'
pkgrel='1'
pkgdesc="GNOME Screen Cast OBS Studio plugin"
changelog='CHANGELOG'
arch=('x86_64')
url="https://github.com/fzwoch/${pkgname}"
license=('GPL2')
depends=('gnome-shell' 'obs-studio' 'gtk3' 'gstreamer' 'gst-plugins-base-libs')
makedepends=('meson' 'git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a67e06a3473a4418ce5437e74aa82a55fe70a7f7d6d61d3e68047973b458db41')

build() {
    arch-meson "${pkgname}-${pkgver}" build
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
