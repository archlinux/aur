# Maintainer: Jianqiu Zhang <void001@archlinuxcn.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=oomd-git
pkgver=20190207
pkgrel=1
pkgdesc='A userspace out-of-memory killer'
arch=('x86_64')
url="https://github.com/facebookincubator/oomd"
license=('GPL2')
depends=('jsoncpp')
makedepends=('meson' 'ninja' 'git' 'jsoncpp')
md5sums=('SKIP')

source=(
    "oomd::git+https://github.com/facebookincubator/oomd.git"
)

build() {
    arch-meson oomd build
    ninja -C build
}

package() {
    DESTDIR=$pkgdir ninja -C build install
    install -Dm644 $srcdir/oomd/src/oomd/etc/desktop.json $pkgdir/etc/oomd/desktop.json.example
}
