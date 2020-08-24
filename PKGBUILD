# Maintainer: jojii <jojii@gmx.net>
pkgname=rsv
pkgver=1.2.0
pkgrel=1
pkgdesc="Runits sv command rewritten in rust with additional features"
makedepends=('rust' 'cargo')
arch=('x86_64')
license=('MIT')
url="https://github.com/JojiiOfficial/rsv"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JojiiOfficial/rsv/archive/v${pkgver}.tar.gz")
md5sums=('ccfe954edf34f2fabe16d5ae5ce99b58')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    return 0
}
