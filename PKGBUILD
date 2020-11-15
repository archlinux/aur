# Maintainer: Fernando Fernández <fernando@softwareperonista.com.ar>
pkgname=gvls
pkgver=0.16.1
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
sha256sums=('abb21906f145e797dc860e51a2f25c51fd3ee450fb355147d3e525470ae053eb')

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
