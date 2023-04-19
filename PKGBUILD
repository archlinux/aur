pkgname=ares-decrypt
pkgver=0.9.0
pkgrel=1
pkgdesc="Automated decoding of encrypted text without knowing the key or ciphers used."
arch=("x86_64")
url="https://github.com/bee-san/Ares"
license=("MIT")
makedepends=("git" "rust")
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build(){
    cd "${srcdir}/Ares"
    cargo build --release
}
package(){
    cd "${srcdir}/Ares"
    install -Dm755 target/release/ares "${pkgdir}/usr/bin/${pkgname}"
    # It seems to be conflict with existing aur/ares package
    # However, they are not relative. Rename to avoid conflict
}

