# Maintainer: lomonosow <lomonosow93@gmail.com>
pkgname=secureboot
pkgver=0.1.3
pkgrel=1
pkgdesc="This package contains script, which helps to manage secureboot. It can generate keys, enroll it to UEFI and sign images"
arch=('any')
url="https://github.com/lomonosow/secureboot"
license=('MIT')
depends=('bash' 'openssl' 'efitools' 'util-linux' 'sbsigntools')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ce39ff472bcd52502d7b49feb724124bb48d937776ad3968a1b3cfc202e8e16a2fba76a004b5c71ea09b3b7fd77222451f9a4d5fee98fc814a5fcf6be066d86c')


package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver"/secureboot.sh "${pkgdir}"/usr/bin/secureboot
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
