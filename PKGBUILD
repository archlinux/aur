# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=wlsunset
pkgver=0.1.0
pkgrel=3
pkgdesc='Day/night gamma adjustments for Wayland compositors'
arch=('x86_64')
url='https://sr.ht/~kennylevinsen/wlsunset'
license=('MIT')
depends=('wayland')
makedepends=('meson' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/wlsunset/archive/0.1.0.tar.gz")
sha256sums=('d9a20744be6a5ef7fceb4e97e831a5c8cec77a95fb8248744ec1e674da3bbe71')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
