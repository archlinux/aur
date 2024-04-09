# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Sergey Bargamon <sergey@bargamon.ru>
pkgname=clink
pkgver=0.4.1
pkgrel=5
pkgdesc="Url cleaner"
arch=("x86_64" "x86_64_v3")
url="https://github.com/Lurk/clink"
license=("MIT")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('33f984c32cb3408ed6dba01ef71f2aa776db28ae1b265c0c434a623779fe15f4144a61fde5fe24a66b69553ad27695333d66af6907a3c7977118e8d1efbd45f1')

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

