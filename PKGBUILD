pkgname=capnproto-java
pkgver=0.1.5
pkgrel=1
pkgdesc="Cap'n Proto for Java"
arch=('i686' 'x86_64')
url="https://github.com/capnproto/capnproto-java"
license=('MIT')
depends=('capnproto')
source=("https://github.com/capnproto/capnproto-java/archive/v${pkgver}.tar.gz")
sha256sums=('1cfb5f191aaa91a0546bf17ff061b7c14cde31a46b4cf27f8215c9edae90ae1a')

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

