# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=restclient-cpp
pkgver=0.5.2
pkgrel=1
pkgdesc="A simple REST client for C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mrtazz/restclient-cpp"
license=('MIT')
depends=('curl')
options=()
source=("https://github.com/mrtazz/$pkgname/archive/$pkgver.tar.gz")
b2sums=('6cb4292fb9e437e0440ff7b53d1f00e157bce5e068a6d74c0380e4b7c7d71cf462d9a3fc30cd05a8788f1efe6cbd042610e41bbf7705389d5f7ec78918e70c64')

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
