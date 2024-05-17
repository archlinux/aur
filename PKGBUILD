# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Sergey Bargamon <sergey@bargamon.ru>
pkgname=clink
pkgver=0.8.0
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
b2sums=('c7ece9a4d1c7e038f17726180a26160cd042c5cb8c0cf2cfaee81606fd34db14e76b61b900e10c94d37f0dcbbe381104c604a21dc878adcb3dd65465caae8d6c')

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

