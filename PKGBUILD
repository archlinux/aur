# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=wlsunset
pkgver=0.3.0
pkgrel=1
pkgdesc='Day/night gamma adjustments for Wayland compositors'
arch=('x86_64')
url='https://sr.ht/~kennylevinsen/wlsunset'
license=('MIT')
depends=('wayland')
makedepends=('meson' 'wayland-protocols' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/wlsunset/archive/${pkgver}.tar.gz")
sha256sums=('9ece2570c3427888a493cd33a129e82634475e6e9286ed729af24fba07ab5424')

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
