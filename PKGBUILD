# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=szyszka-bin
_name="${pkgname%-bin}"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple but powerful batch file rename program"
arch=('x86_64')
url="https://github.com/qarmin/szyszka"
license=('MIT')
depends=('gtk3')
provides=("$_name")
conflicts=("$_name")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/linux_$_name"
        "https://raw.githubusercontent.com/qarmin/$_name/$pkgver/LICENSE"
        "https://raw.githubusercontent.com/qarmin/$_name/$pkgver/README.md")
sha256sums=('b4928b75917dfb1eed7b0f1651e4bbd70168f1d640af44ab3af3c9ebc1a531aa'
            'c5613b61c143e5fc1fde6661b6808effc80e1eebf2bd954e17eb2382ef72400b'
            '7421d0ef8abff98f650ed5e94713aad4fa176b7a627e0866177ed134e4469c7d')

package() {
  install -Dvm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_name"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
