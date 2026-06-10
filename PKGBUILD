# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=msmtpq-systemd
url="https://codeberg.org/VannTen/$pkgname"
pkgver=1.1.0
pkgrel=1
pkgdesc="Systemd unit for queuing and sending mail"
arch=(any)
license=('MIT')
provides=('smtp-forwarder')
conflicts=('smtp-forwarder')
depends=(msmtp bash)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1695dad93c4b88731904156e0548c1ed4311754bc61a5e99318c1c71d62d2ff47090ec84795cadabdbaad32761c648fab1c544cf819f92611ef1b2f3b7aef282')

package() {
    make DESTDIR="$pkgdir" install
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
