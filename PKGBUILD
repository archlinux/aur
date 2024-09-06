# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=fcsolid-backgrounds
pkgver=1
pkgrel=1
pkgdesc="Boring background images and data for GNOME shell"
url="https://codeberg.org/fabiscafe/fcsolid"
arch=(any)
license=(CC-BY-4.0)
depends=(libjxl)
makedepends=(
  git
  meson
)
source=("${pkgname}::git+https://codeberg.org/fabiscafe/fcsolid.git#tag=${pkgver}")
b2sums=('08a0df262ea4c3ea4460a58e73b9e7aabf3ce654e36d03da5983795db76c37bf319f02514a9c96c6c5a1064933a238f47d84ab5df65506c5f9c5f520f6685029')

build() {
  arch-meson ${pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
