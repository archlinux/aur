# Maintainer: schard <mail at richard dash neumann period de>
pkgname=obs-gnome-screencast
pkgver=0.0.10
pkgrel=1
pkgdesc="GNOME Screen Cast OBS Studio plugin, supports Wayland"
arch=('any')
url="https://github.com/fzwoch/${pkgname}"
license=('GPL2')
depends=('gnome-shell' 'obs-studio')
makedepends=('meson')
source=("https://github.com/fzwoch/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f452670c0ffee3b08296370e7cfe6ac2b442588942b96c78e0b1bf05f09b6e49')


build() {
    cd "${pkgname}-${pkgver}"
    meson --buildtype=release build 
    ninja -C build 
}


package() {
    install -Dm 644 "${pkgname}-${pkgver}/build/gnome-screencast.so" "${pkgdir}/usr/lib/obs-plugins/gnome-screencast.so"
}
