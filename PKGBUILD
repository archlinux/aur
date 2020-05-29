# Maintainer: lomonosow <lomonosow93@gmail.com>
pkgname=secureboot
pkgver=0.1.2
pkgrel=2
pkgdesc="This package contains script, which helps to manage secureboot. It can generate keys, enroll it to UEFI and sign images"
arch=('any')
url="https://github.com/lomonosow/secureboot"
license=('MIT')
depends=('bash' 'openssl' 'efitools' 'util-linux' 'sbsigntools')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9f79a49cd4ff6f8f86b658efad1d97bf2a8f5a4e1d37a286b6550852ac22109d98cf370f94f51c3a9edba5557401b543036501f5251b9b51a858b4ce36da5d8e')


package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver"/secureboot.sh "${pkgdir}"/usr/bin/secureboot
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
