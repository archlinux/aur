# Maintainer: David Garfias <jose.garfias@ingenieria.unam.edu> 
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: schard <mail@richard.neumann.de>

pkgname='obs-gnome-screencast'
pkgver='0.2.0'
pkgrel='1'
pkgdesc="GNOME Screen Cast OBS Studio plugin"
changelog='CHANGELOG'
arch=('x86_64')
url="https://github.com/fzwoch/${pkgname}"
license=('GPL2')
depends=('gnome-shell' 'obs-studio' 'gstreamer' 'gst-plugins-base-libs')
makedepends=('meson' 'git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ed48de33b1f0a89a0bee33683006a25925780f3e962d5ead8292241f1540353a')

build() {
    arch-meson "${pkgname}-${pkgver}"  build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" ninja install -C build
}
