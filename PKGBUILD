# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hys
pkgver=0.1.2
pkgrel=4
pkgdesc='Terminal RSS Reader for Digital Minimalists in Zig.'
url='https://github.com/superstarryeyes/hys'
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
makedepends=('zig')
provides=('hys')
conflicts=('hys-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('38340bf3bd5392b0944b23114719f7d5bf1420a0dcdab05e41c190aaa8a62bf4')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t ${pkgdir}/usr/bin 'zig-out/bin/hys'
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
