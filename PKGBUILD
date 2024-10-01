# Maintainer: Braulio <brauliobo@gmail.com>
pkgname=bindp
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool to bind an application to a specific IP address on Linux"
arch=('x86_64')
url="https://github.com/brauliobo/bindp"
license=('GPL')
depends=('glibc')
makedepends=('git' 'make')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')  # Optional, can be replaced with the actual checksum of the source tarball

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 libindp.so "$pkgdir/usr/lib/libindp.so"
    install -Dm755 bin/bindp "$pkgdir/usr/bin/bindp"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


