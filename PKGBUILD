# Maintainer: Pan Lanlan <abbypan@gmail.com>
pkgname=leancrypto
pkgver=1.0.0
pkgrel=1
pkgdesc='The leancrypto library is a cryptographic library that exclusively contains only PQC-resistant cryptographic algorithms.'
arch=('any')
license=('GPL2')
depends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smuellerDD/leancrypto/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e924430d6cc0b0ce274018b3d4a471326b05937e86b2742ccd359be1e3b48a3')
url="https://github.com/smuellerDD/${pkgname}"

build() {
	cd "$pkgname-$pkgver"
    meson setup build
    meson compile -C build
}

package() {
	cd "$pkgname-$pkgver"
    meson install -C build --destdir $pkgdir
}

