# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=biblereader
pkgver=1.0.6
pkgrel=1
pkgdesc="A GTK Frontend for libbible"
arch=('x86_64')
url="https://vance.fish/git/biblereader"
license=('GPL')
depends=(gtkmm3 'libbible>=1.0.1')
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

sha256sums=('497d1adc2294c563e6aaff62bb6fd92cde499476dc23f4d16758eedd16c23882'
            'SKIP')
