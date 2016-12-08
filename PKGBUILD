# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=restclient-cpp
pkgver=0.4.4
pkgrel=1
pkgdesc="A simple REST client for C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mrtazz/restclient-cpp"
license=('MIT')
depends=('curl')
options=()
source=("https://github.com/mrtazz/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f89355d4a635d35e19082078a86c18af8e05e033361d474b20d7b8589257d05d')

build() {
    cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
