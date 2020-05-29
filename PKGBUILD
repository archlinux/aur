# Maintainer: lomonosow <lomonosow93@gmail.com>
pkgname=secureboot
pkgver=0.1.1
pkgrel=1
pkgdesc="This package contains script, which helps to manage secureboot. It can generate keys, enroll it to UEFI and sign images"
arch=('any')
url="https://github.com/lomonosow/secureboot"
license=('MIT')
depends=('bash' 'openssl' 'efitools' 'util-linux' 'sbsigntools')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('85d0bb4260dc0ed744bacb8468121e03c9c47f7fd3cf04f99a36f9fde79476b9cd418d7d4ce157633bb84f85b7da7649255396b27b3b07647106243c2c50b4d9')


package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver"/secureboot.sh "${pkgdir}"/usr/bin/secureboot
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
