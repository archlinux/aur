# Maintainer: Fernando Fernández <fernando@softwareperonista.com.ar>
pkgname=gvls
pkgver=0.14.3
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
sha256sums=('56eeb00ad8272462caffe8b3a4e4a7752c1c3f9b9203d32deadc2e14f7da4f5b')

prepare() {
  cd ${pkgname}-${pkgname}-${pkgver}

# patch -Np1 -i ../
}

build() {
  arch-meson ${pkgname}-${pkgname}-${pkgver} build

  ninja -C build
}

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
