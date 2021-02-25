# Maintainer: Sergey Bargamon <sergey@bargamon.ru>
pkgname=clink
pkgver=0.4.1
pkgrel=1
pkgdesc="Url cleaner"
url="https://github.com/Lurk/clink"
license=("MIT")
source=("git+$url#tag=$pkgver")
md5sums=("SKIP")
arch=("x86_64")
makedepends=("cargo" "git")

build() {
    cd $pkgname
    cargo build --release
}

package() {
    cd $pkgname
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

