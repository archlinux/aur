pkgname=vintage-basic-bin
pkgver=1.0.3
pkgrel=4
pkgdesc='Vintage BASIC Interpreter'
arch=('x86_64')
url='http://vintage-basic.net'
license=('BSD')
provides=('vintage-basic')
source=("http://vintage-basic.net/downloads/vintage-basic-$pkgver-linux-x86_64.tar.gz")
sha512sums=('c654209689c25098f6321fb47c2a46a2cc562358b12c746d71b5e6c2e52cb86cb8887233d3684ed355dbddb585d9eca571b220536a90c60e00e83d25ad1bd39c')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/doc/vintage-basic"
    mkdir -p "${pkgdir}/usr/share/licenses/vintage-basic"

    cd "${srcdir}/vintage-basic-$pkgver-linux-x86_64" || exit 1
    cp bin/vintbas "${pkgdir}/usr/bin"

    cd "share/doc/vintage-basic-${pkgver}" || exit 1
    rm examples/._*.bas
    cp -r ./* "${pkgdir}/usr/share/doc/vintage-basic"
    cp LICENSE.txt "${pkgdir}/usr/share/licenses/vintage-basic"
}
