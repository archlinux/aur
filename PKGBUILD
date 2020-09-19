# Maintainer: Fernando Fernández <fernando@softwareperonista.com.ar>
pkgname=gvls
pkgver=0.16.0
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
sha256sums=('854a34c2c2b35bd744f4199758276fd889134a3e15d4b5dc4c2a577eee31da84')

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
