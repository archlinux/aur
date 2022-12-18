# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.28
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.28/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.28/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.28/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.28/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.28/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.28/tut-arm64-static")

sha256sums=('6dbc41e0615e1e2a2e1d56ecf2a3a9f555bb39ab16fabc8f4a0cdc35735188bf')
sha256sums_x86_64=('8b159428846d73e83bffd1fd117895068735a5ffd85938043e83b25237a36e5a')
sha256sums_i686=('c44f3e1e7ad22b5d93bf910ff5f80ebdbfcdec4f70ac63b07efe29dca5bb193b')
sha256sums_arm=('417cd978fd3bbd03f5452ac1566733f3d4074c03b7669429953c499adc647112')
sha256sums_armv6h=('481c0bdf5ca998a1b5b8964ca7959cb299621e80e2bc4ca1519374a4130cfe69')
sha256sums_armv7h=('b8540e70fa21a6c33d37ed6573488ce0db9c336fd5af342aca9cd434161e7976')
sha256sums_aarch64=('b01c1b68c570e60428b381900fb492b74e3153c87e1ffc780c2633b73a803e0e')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
