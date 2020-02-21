# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: schard <mail at richard dash neumann period de>

pkgname='obs-gnome-screencast'
pkgver='0.1.0'
pkgrel='1'
pkgdesc="GNOME Screen Cast OBS Studio plugin"
changelog='CHANGELOG'
arch=('x86_64')
url="https://github.com/fzwoch/${pkgname}"
license=('GPL2')
depends=('gnome-shell' 'obs-studio' 'gtk3' 'gstreamer' 'gst-plugins-base-libs')
makedepends=('meson' 'git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    arch-meson ${pkgname} build
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
