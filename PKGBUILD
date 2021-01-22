# Maintainer: jojii <jojii@gmx.net>
pkgname=mediad
_pkgname=MediaD
pkgver=0.1.3
pkgrel=1
pkgdesc="A Simple and lightweight daemon to handle keyboard media buttons easily"
url="https://github.com/JojiiOfficial/${_pkgname}"
license=("GPL-3.0")
source=("git+$url#tag=v$pkgver")
md5sums=("SKIP")
arch=("x86_64")
depends=("libpulse" "dbus")
makedepends=("cargo" "git")

build() {
    cd $_pkgname
    cargo build --release
}

package() {
    cd $_pkgname
    usrdir="$pkgdir/usr"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

