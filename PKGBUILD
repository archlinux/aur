# Maintainer: Fernando Fernández <fernando@softwareperonista.com.ar>
pkgname=gvls
pkgver=0.16.2
pkgrel=1
pkgdesc='GNOME Vala Language Server'
arch=(i686 x86_64)
url='https://gitlab.gnome.org/esodan/gvls'
license=(LGPL3)
conflicts=()
provides=()
depends=(vala libgee libpeas gtksourceview3 jsonrpc-glib)
makedepends=(git meson)
optdepends=()
groups=()
source=("https://gitlab.gnome.org/esodan/gvls/-/archive/${pkgname}-${pkgver}/${pkgname}-${pkgname}-${pkgver}.tar.gz")
sha256sums=('e939290d2d23bebcdee93140fd9422a724f0b90a8c69c0b8e0c3588acf2f1abe')

prepare() {
  cd ${pkgname}-${pkgname}-${pkgver}

# patch -Np1 -i ../
}

build() {
  arch-meson ${pkgname}-${pkgname}-${pkgver} build --wrap-mode=nofallback

  ninja -C build
}

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
