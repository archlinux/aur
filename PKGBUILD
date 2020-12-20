# Maintainer: Fernando Fernández <fernando@softwareperonista.com.ar>
pkgname=gvls
tag=18.0
pkgver=0.${tag}
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
source=("https://gitlab.gnome.org/esodan/gvls/-/archive/${pkgname}-${tag}/${pkgname}-${pkgname}-${tag}.tar.gz")
sha256sums=('9e8015ae4464828733290adebf9f79a5fb7b5e739cca3ba25aa9854fc3216763')

prepare() {
  cd ${pkgname}-${pkgname}-${tag}

# patch -Np1 -i ../
}

build() {
  arch-meson ${pkgname}-${pkgname}-${tag} build --wrap-mode=nofallback

  ninja -C build
}

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
