# Maintainer:
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2024.2.29
_pkgver="${pkgver}-2"
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('9108ffbbbbfd156bbe2692d75aa4894ca55674133c2870272e283c19c35d1ee6')

build() {
  arch-meson "${pkgname}-${_pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
