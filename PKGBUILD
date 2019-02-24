pkgname=memutils-git
pkgver=r49.g8447865
pkgrel=1

pkgdesc='utilities for watching and modifying the memory of running processes'
url='https://git.cloudef.pw/memutils.git'
arch=('x86_64')
license=('zlib')

depends=('glibc')
makedepends=('git')

provides=('memutils')
conflicts=('memutils')

source=('git+https://git.cloudef.pw/memutils.git')

sha256sums=('SKIP')

pkgver() {
    cd memutils
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd memutils
    make
}

package() {
    cd memutils
    make PREFIX=/usr DESTDIR="$pkgdir" install
    # install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
