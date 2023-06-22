# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=biblereader
pkgver=1.0.7
pkgrel=2
pkgdesc="A GTK Frontend for libbible"
arch=('x86_64')
url="https://vance.fish/git/biblereader"
license=('GPL3')
depends=(gtkmm3 gcc-libs glibc libsigc++ glibmm hicolor-icon-theme atkmm 'libbible>=1.0.1')
source=($url/snapshot/$pkgname-$pkgver.tar.gz{,.asc})
validpgpkeys=('2FCF3A100A5B5C0E78E41BDB215A56B23729BC81') # Nathan Vance <natervance@gmail.com>

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

sha256sums=('64bcac276a79ac9bb81e729cbe28cd5f3be5b2fb40cda7807060d5dc5f61e4c3'
            'SKIP')
