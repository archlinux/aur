# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2024.5.7
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
         'python'
         'python-gobject'
         'python-requests')
makedepends=('desktop-file-utils' 'gtk-update-icon-cache' 'meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('140e4c04ca3ee63988460c46df809c3762fe32e1a587556b18f4fa4e8ea4fe42')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
