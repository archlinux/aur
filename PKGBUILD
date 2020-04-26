# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=qrcp
pkgver=0.5.0
pkgrel=1
pkgdesc="Transfer files over Wi-Fi from your computer to a mobile device by scanning a QR code without leaving the terminal"
arch=('i686' 'x86_64')
url="https://github.com/claudiodangelis/qrcp"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('495a54726f843f57bb26f314b902a355b1ed6b99dbd5799f442eef6c5e92045a')

build() {
    cd $pkgname-$pkgver
    go build -trimpath -ldflags "-extldflags $LDFLAGS" -o $pkgname
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
