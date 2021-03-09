# Maintainer: David Garfias <jose.garfias@ingenieria.unam.edu> 
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: schard <mail@richard.neumann.de>

pkgname='obs-gnome-screencast'
pkgver='0.1.2'
pkgrel='1'
pkgdesc="GNOME Screen Cast OBS Studio plugin"
changelog='CHANGELOG'
arch=('x86_64')
url="https://github.com/fzwoch/${pkgname}"
license=('GPL2')
depends=('gnome-shell' 'obs-studio' 'gstreamer' 'gst-plugins-base-libs')
makedepends=('meson' 'git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a8ff8cbdb01c7c8e60f62a137eedc857bc44ffa3aa127fed269a8f2e5d1485f5')

build() {
    arch-meson "${pkgname}-${pkgver}"  build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" ninja install -C build
}
