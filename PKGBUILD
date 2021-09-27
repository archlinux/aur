pkgname=capnproto-java
pkgver=0.1.10
pkgrel=1
pkgdesc="Cap'n Proto for Java"
arch=('i686' 'x86_64')
url="https://github.com/capnproto/capnproto-java"
license=('MIT')
depends=('capnproto')
source=("https://github.com/capnproto/capnproto-java/archive/v${pkgver}.tar.gz")
sha256sums=('b88a1a419f71c0b39e91296c6f2e10dd498f052ccf4b885947baedc310f4df95')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    
    install -D capnpc-java "$pkgdir"/usr/bin/capnpc-java
    install -Dm644 compiler/src/main/schema/capnp/java.capnp "$pkgdir"/usr/include/capnp/java.capnp
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

