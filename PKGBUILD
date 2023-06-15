# Maintainer: Ali Riza Keskin <aliriza.keskin@pardus.org.tr>
pkgname="sterm-git"
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
    cd "$pkgname-$pkgver"
    meson setup build --prefix=/usr
    ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  ninja install -C install DESTDIR="${pkgdir}"
}
