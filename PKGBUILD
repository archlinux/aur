#Maintainer: Illia Shestakov <illia@ishestakov.com>

pkgname=ncdu2
pkgver=2.0
_pkgver2=beta2
pkgrel=1
pkgdesc="Disk usage analyzer with an ncurses interface. Rewrite in Zig."
arch=("i686" "x86_64")
url="https://dev.yorhel.nl/ncdu"
license=('MIT')
depends=("ncurses")
makedepends=("zig" "make")
source=("https://dev.yorhel.nl/download/ncdu-${pkgver}-${_pkgver2}.tar.gz")
sha512sums=("4e69d792b281b27bbd99f2426d0f48765f7a6096f618efddf5362bc3303a807544a4f7149e0ca6e2bcb3527e928d26466b3558094ab1ae6595fa06e810910c24")

build() {
    cd "${srcdir}/ncdu-${pkgver}-${_pkgver2}"

    make
}

package() {
    cd "${srcdir}/ncdu-${pkgver}-${_pkgver2}"

    install -Dm755 zig-out/bin/ncdu "${pkgdir}/usr/bin/ncdu2"
}
