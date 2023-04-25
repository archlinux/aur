
pkgname=yai
pkgver=0.6.0
pkgrel=1
pkgdesc="Yai - Your AI powered terminal assistant"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/ekkinox/yai"
license=('MIT')
makedepends=('go')
source=("https://github.com/ekkinox/yai/archive/${pkgver}/v${pkgver}.tar.gz")
sha256sums=('16fc15da1157d20b636873d867258c9a0326c52150a02e127a77e505c31351ca')


build() {

  cd "$srcdir/$pkgname-$pkgver"
  go build -o yai main.go

}

package() {

    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 yai "${pkgdir}/usr/local/bin/yai"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/yai/LICENSE"

}


