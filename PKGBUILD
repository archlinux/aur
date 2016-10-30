# Maintainer: SY.Zhang <lastavengers@archlinuxcn.org>
pkgname=loc
pkgver=0.3.2
pkgrel=1
pkgdesc='Count lines of code quickly'
arch=('x86_64' 'i386')
url='https://github.com/cgag/loc'
license=('MIT')
makedepends=('cargo-nightly' 'git')
source=("https://github.com/cgag/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build () {
    cd ${pkgname}-${pkgver}
    cargo build --release
}

package () {
    cd ${pkgname}-${pkgver}/target/release
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
