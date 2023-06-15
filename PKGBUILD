# Maintainer: Ali Riza Keskin <aliriza.keskin@pardus.org.tr>
pkgname="sterm-app"
pkgver="master"
pkgrel=1
pkgdesc="Sulincix Terminal"
arch=("any")
url="https://gitlab.com/sulincix/sterm"
license=(GPL3)
makedepends=("meson" "vala")
source=("https://gitlab.com/sulincix/sterm/-/archive/master/sterm-master.tar.gz")
md5sums=("SKIP")

depends=(
    vte3
    gtk3
)

build() {
    cd "sterm-$pkgver"
    meson setup build --prefix=/usr \
        -Ddebug=false
    ninja -C build
}

package() {
  cd "sterm-$pkgver"
  export DESTDIR="${pkgdir}" 
  ninja install -C build
}
