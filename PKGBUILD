# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=wlsunset
pkgver=0.2.0
pkgrel=2
pkgdesc='Day/night gamma adjustments for Wayland compositors'
arch=('x86_64')
url='https://sr.ht/~kennylevinsen/wlsunset'
license=('MIT')
depends=('wayland')
makedepends=('meson' 'wayland-protocols' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/wlsunset/archive/${pkgver}.tar.gz")
sha256sums=('88bce695722a09d79545f14d404cc0659f7176bb08d5db5f4f23228b6ba8bb03')

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
