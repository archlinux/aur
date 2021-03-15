# Maintainer: jojii <jojii@gmx.net>
pkgname=jisho
_gitname=jisho-cli
pkgver=0.1.4
pkgrel=1
pkgdesc="A very simple cli tool to lookup Japanese words using jisho.org"
url="https://github.com/JojiiOfficial/jisho-cli"
license=("GPL-3.0")
source=("git+$url#tag=v$pkgver")
md5sums=("SKIP")
arch=("x86_64")
makedepends=("cargo" "git")

build() {
    cd $_gitname
    cargo build --release
}

package() {
    cd $_gitname
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    install -Dm 755 "target/release/${_gitname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

