# Maintainer: Mingi Sung <fiestalake@disroot.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Nevar <psi.neamf@gmail.com>

pkgname=nautilus-share-gtk4
_pkgname=nautilus-share
pkgver=0.7.5
pkgrel=2
pkgdesc='Nautilus extension to share folder using Samba, which supports libnautilus-extension-4 in GTK4'
arch=('x86_64')
url="https://gitlab.gnome.org/coreyberla/nautilus-share"
license=('GPL')
depends=('nautilus' 'samba')
makedepends=('intltool' 'meson')
provides=('nautilus-share')
conflicts=('nautilus-share')
source=("${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('5a251595bfd2e4375f4dd91f5ee7f5b29681435bd2f268861e5fcc5cd6b1f0b9ced98cb269439b7a90329af071f0b91d2c767c408d3c1fd27fa9322693d150d8')

build() {
  arch-meson ${_pkgname}-${pkgver} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

