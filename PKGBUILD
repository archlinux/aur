# Maintainer: Yorick Peterse
pkgname=git-clogs
pkgver=0.7.0
pkgrel=1
pkgdesc="Generate a changelog from Git commits containing trailers"
url="https://github.com/yorickpeterse/clogs"
license=(MPL2)
arch=(x86_64)
depends=(git)
makedepends=(inko)
provides=(clogs)
conflicts=()
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/yorickpeterse/clogs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9755d05be34dbb8bcb5f3675e37c82163f99999d661c24ebbcef2449dba3e971')

build() {
    cd "clogs-${pkgver}"
    inko pkg sync
    inko build -o ./build/clogs
}

package() {
    cd "clogs-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" ./build/clogs
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
