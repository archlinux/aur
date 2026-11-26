# Maintainer: alcubierre-drive
pkgname=narcolepsyd
pkgrel=1
pkgver=0.1.0
pkgdesc="An idle power optimizer for Linux laptops with Intel hybrid CPUs"
arch=('x86_64')
url="https://github.com/obra/narcolepsyd"
license=('Apache')
depends=('systemd')
makedepends=('git' 'cargo')
source=("git+http://github.com/obra/${pkgname}.git")
md5sums=('SKIP')

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    install -m755 -D target/release/narcolepsyd -t "$pkgdir/usr/local/bin/"
    install -m644 -D dist/narcolepsyd.service -t "$pkgdir/etc/systemd/system/"
}
