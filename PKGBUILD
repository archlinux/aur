# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.13
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.13/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.13/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.13/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.13/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.13/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.13/tut-arm64-static")

sha256sums=('1edf30f80633c1be6d1542e678fddd9b8d9fffc0f9f393932cbbcc9aeffda4ea')
sha256sums_x86_64=('3d1142487906845b85919a953b2b13ffa4ef1d51053c8afbd41f3b33e2eaff70')
sha256sums_i686=('8429e79186bdd3d4f14da90e274184322dc47a65ef81f9eb2b2f35b922d9fd6c')
sha256sums_arm=('26a561649ebf94198fd9b3151c8f9051edf6e843584f1159b9bd9d72a275bec6')
sha256sums_armv6h=('aa00458a4804864598678350f2189d283d8829fdd5ed300ba9adc5c309d3e80d')
sha256sums_armv7h=('53171690596113e3fc48f19beaf21988ae4b1f3b394367ce415d1272d8a565ab')
sha256sums_aarch64=('a035dd3907133011d0d268e30d10e2d7aa490b572817f7b0b6a617e625d38434')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
