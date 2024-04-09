# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Sergey Bargamon <sergey@bargamon.ru>
pkgname=clink
pkgver=0.7.1
pkgrel=1
pkgdesc="Clean URLs copied to clipboard"
arch=("x86_64" "x86_64_v3")
url="https://github.com/Lurk/clink"
license=("MIT")
makedepends=(
  cargo
  libxcb
  libxkbcommon
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('b57738e524219eb63f5dd3730d2c98b9fe515aace7ce9b653a7a21574adb36857d102e08f16c03082070aedee351348fb1a92e4a65188afcc81c6be51fca84d1')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/readme.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

