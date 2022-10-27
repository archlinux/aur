# Maintainer: Mingi Sung <FiestaLake@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Nevar <psi.neamf@gmail.com>

pkgname=nautilus-share-gtk4
_pkgname=nautilus-share
pkgver=0.7.5
pkgrel=1
pkgdesc='Nautilus extension to share folder using Samba (from debian for gtk4 support)'
arch=('x86_64')
url="https://git.gnome.org/browse/nautilus-share"
license=('GPL')
depends=('nautilus' 'samba')
makedepends=('intltool' 'meson')
provides=('nautilus-share')
conflicts=('nautilus-share')
source=("http://deb.debian.org/debian/pool/main/n/${pkgname}/${_pkgname}_${pkgver}.orig.tar.bz2")
sha512sums=('ef6d540ff3529138a3ed0f834e46b57bfb4bc5a88f7f1b7fdc66d1fd619963ff7ab5356689e56af86148002bee21492bb09860e5352674dee54c7199f6b1c81b')

build() {
  arch-meson ${_pkgname}-${pkgver} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

