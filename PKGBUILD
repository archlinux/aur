# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=cliqr
pkgver=1.0.0
pkgrel=2
pkgdesc="Command line QR code generator"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/flipflop97/cliqr"
license=('Creative Commons Attribution-ShareAlike 4.0 International Public License')
depends=('qrencode')
makedepends=('clang' 'qrencode')
provides=('cliqr')
source=("https://github.com/flipflop97/cliqr/archive/v1.0.0.zip")
sha256sums=('914982a5a60ccb96b3b4bec039b91f5f3074fd74e1ae01f14304a8dfba2c7fc2')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -dm 755 "${pkgdir}/usr/bin"
    install -m 755 "cliqr" "${pkgdir}/usr/bin"
}
