# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2024.11.7
pkgrel=1
pkgdesc="Download manager based on aria2"
arch=('any')
url="https://github.com/giantpinkrobots/varia"
license=('MPL-2.0')
depends=('aria2'
         'aria2p'
         'bash'
         'dconf'
         'glib2'
         'gtk4'
         'hicolor-icon-theme'
         'libadwaita'
         'pango'
         'python'
         'python-gobject'
         'python-requests')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b83ad82a62e322f406dee36bcc1733e3c3ff1527eb40016577eccfb9526b9f4')

build() {
    arch-meson "${pkgname}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
