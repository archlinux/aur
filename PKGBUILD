# Maintainer:
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2024.3.20
pkgrel=1
pkgdesc="Download manager based on aria2"
arch=('any')
url="https://github.com/giantpinkrobots/varia"
license=('MPL-2.0')
depends=('aria2'
         'aria2p'
         'bash'
         'dconf'
         'gobject-introspection-runtime'
         'hicolor-icon-theme'
         'python'
         'python-gobject'
         'python-requests')
makedepends=('desktop-file-utils' 'gtk-update-icon-cache' 'meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b5813b5fb90d197b641e7f280a74b36f1092025013a7f47ce4cdcd7eaf0c6ea')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
