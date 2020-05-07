# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=qrcp
pkgver=0.6.2
pkgrel=1
pkgdesc="Transfer files over Wi-Fi from your computer to a mobile device by scanning a QR code without leaving the terminal"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/claudiodangelis/qrcp"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a71105cbe0e6cfee4772b72a531c9532c6f9550d22614a7f09ee4902ed813820')

build() {
    cd $pkgname-$pkgver
    go build -trimpath -ldflags "-extldflags $LDFLAGS" -o $pkgname
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
