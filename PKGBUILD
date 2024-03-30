# Maintainer: Sam Day <me@samcday.com>

pkgname=qmic
pkgver=1.0
pkgrel=1
pkgdesc="QMI IDL compiler"
arch=(aarch64 x86_64)
url="https://github.com/andersson/qmic"
license=(BSD)
makedepends=()
provides=(qmic)
conflicts=(qmic)
_srcname="${pkgname}-${pkgver}"
source=("${_srcname}.tar.gz::https://github.com/linux-msm/qmic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2797c85a2b617b2b35024566105f4d8e998ef576f0f96f7923abf3717d12e86')


build() {
    cd "${_srcname}"
    make
}

package() {
    cd "${_srcname}"
    make DESTDIR="$pkgdir/" prefix=/usr install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
