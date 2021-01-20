# Maintainer: lomonosow <lomonosow93@gmail.com>
pkgname=secureboot
pkgver=0.1.4
pkgrel=1
pkgdesc="This package contains script, which helps to manage secureboot. It can generate keys, enroll it to UEFI and sign images"
arch=('any')
url="https://github.com/lomonosow/secureboot"
license=('MIT')
depends=('bash' 'openssl' 'efitools' 'util-linux' 'sbsigntools')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ad0e50ae0803a51e74ca6bf02f1495665104a548b4ee4c3d6669d900d26ba54fa4e3041f3fcaee96a3f3ee41305187bd53a35c36e372e621cca19f3b76422bf1')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver"/secureboot.sh "${pkgdir}"/usr/bin/secureboot
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
