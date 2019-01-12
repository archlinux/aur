# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=restclient-cpp
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple REST client for C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mrtazz/restclient-cpp"
license=('MIT')
depends=('curl')
options=()
source=("https://github.com/mrtazz/$pkgname/archive/$pkgver.tar.gz")
sha384sums=('fe32848366110d5247bad1a7450817ed26dbaabc0b2b7d5bd3407c3a68efb5ea319f2edc1c0cda4fed4574d9bcb55b6b')

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
