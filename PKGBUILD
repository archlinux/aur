# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=aribb25
pkgver=0.2.7
pkgrel=1
pkgdesc="Basic implementation of the ARIB STD-B25 public standard"
arch=('x86_64')
url="https://code.videolan.org/videolan/aribb25"
license=('custom:ISC')
source=("https://code.videolan.org/videolan/aribb25/-/archive/$pkgver/aribb25-$pkgver.tar.gz")
sha256sums=('3d057fe0c5cd04c78364736c352c4f8c650d48e57a5e5effdb8e3fef9faab4e6')
depends=('pcsclite')
makedepends=('libtool' 'autoconf' 'pkg-config' 'automake')

build() {
    cd "$pkgname-$pkgver"
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
