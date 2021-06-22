pkgname=hwangsae-git
pkgver=r288.7ca17e4
pkgrel=1
pkgdesc='Hwangsae is a library that implements forwarding and stream access control services for Hwangsaeul'
arch=('x86_64')
url='https://github.com/hwangsaeul/hwangsae'
license=('APACHE-2.0')
conflicts=('hwangsae')
provides=('hwangsae')
source=('git+https://github.com/hwangsaeul/hwangsae.git')
sha256sums=('SKIP')

pkgver() {
    cd hwangsae
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd hwangsae

    meson --prefix /usr build
    ninja -C build
}

package() {
    cd hwangsae
    DESTDIR="$pkgdir" ninja -C build install
}
