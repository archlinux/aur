# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=szyszka-bin
_name="${pkgname%-bin}"
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple but powerful batch file rename program"
arch=('x86_64')
url="https://github.com/qarmin/szyszka"
license=('MIT')
depends=('gtk3')
provides=("$_name")
conflicts=("$_name")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/linux_$_name"
        "$_name.desktop::https://raw.githubusercontent.com/qarmin/szyszka/$pkgver/data/com.github.qarmin.szyszka.desktop"
        "https://raw.githubusercontent.com/qarmin/szyszka/$pkgver/data/icons/com.github.qarmin.szyszka.png"
        "https://raw.githubusercontent.com/qarmin/szyszka/$pkgver/LICENSE"
        "https://raw.githubusercontent.com/qarmin/szyszka/$pkgver/README.md")
sha256sums=('b4928b75917dfb1eed7b0f1651e4bbd70168f1d640af44ab3af3c9ebc1a531aa'
            '05f63e5dcfdf6bd0bab81b5083bcb7221233f5f74665f7481160d1d028750a89'
            '363ef90e47fd120a602db643661c2fe334490a3301d4033b9cf188b7182e0904'
            'c5613b61c143e5fc1fde6661b6808effc80e1eebf2bd954e17eb2382ef72400b'
            '7421d0ef8abff98f650ed5e94713aad4fa176b7a627e0866177ed134e4469c7d')

package() {
  install -Dvm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_name"
  install -Dvm 644 "$_name.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dvm 644 "com.github.qarmin.$_name.png" -t "$pkgdir/usr/share/icons"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
