pkgname=capnproto-java
pkgver=0.1.2
pkgrel=1
pkgdesc="Cap'n Proto for Java"
arch=('i686' 'x86_64')
url="https://github.com/capnproto/capnproto-java"
license=('MIT')
depends=('capnproto')
source=("https://github.com/capnproto/capnproto-java/archive/v0.1.2.tar.gz")
sha384sums=('33802b6bb48f67df8f3c9890e3740588de3435dd57134465e8da6344c241fe828b9fb915f5d1cee79ddfc9d99c9de76f')

build() {
    cd "$pkgname-$pkgver"
    
    make
}

package() {
    cd "$pkgname-$pkgver"
    
    install -D capnpc-java "$pkgdir"/usr/bin/capnpc-java
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

