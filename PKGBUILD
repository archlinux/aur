# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=restclient-cpp
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple REST client for C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mrtazz/restclient-cpp"
license=('MIT')
depends=('curl')
options=()
source=("https://github.com/mrtazz/$pkgname/archive/$pkgver.tar.gz")
sha384sums=('1e2ade997e524c6867fafbb74626b26b778a0856743aedaf32fbd48e25f5a335c53555eb8af96e6dbd87b6447df1c04d')

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
