# Maintainer: schard <mail at richard dash neumann period de>
pkgname=obs-gnome-screencast
pkgver=0.1.0
pkgrel=1
pkgdesc="GNOME Screen Cast OBS Studio plugin, supports Wayland"
arch=('any')
url="https://github.com/fzwoch/${pkgname}"
license=('GPL2')
depends=('gnome-shell' 'obs-studio')
makedepends=('meson')
source=("https://github.com/fzwoch/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('26f1c082c8b30f1d6046d7ad2f44a7b6a5664220c1eb3c41f7725d1510162ced')


build() {
    meson --buildtype=release --prefix=/usr "${pkgname}-${pkgver}" "${pkgname}-${pkgver}/build"
    ninja -C "${pkgname}-${pkgver}/build"
}


package() {
    DESTDIR="${pkgdir}" ninja -C "${pkgname}-${pkgver}/build" install
}
