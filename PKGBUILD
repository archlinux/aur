# Maintainer: Super Tecno Gym <banana@grrlz.net>

pkgname="tqftpserv"
pkgdesc="Trivial File Transfer Protocol server over AF_QIPCRTR"
pkgver=1.1
pkgrel=1
arch=(aarch64 x86_64)
url="https://github.com/linux-msm/tqftpserv"
license=("BSD-3-Clause")
_srcname="${pkgname}-${pkgver}"
source=("${_srcname}.tar.gz::https://github.com/linux-msm/tqftpserv/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a7ebf03aa19e5deabcb499836ccf7378a0cd65452232f87406790a5509421527')
makedepends=(meson)

build() {
        cd "$_srcname"

        mkdir -p build
        meson setup build --prefix=/usr
        meson compile -C build

}

package() {
        cd "$_srcname"

        meson install -C build --destdir "$pkgdir"
        install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
