# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.26
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.26/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.26/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.26/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.26/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.26/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.26/tut-arm64-static")

sha256sums=('693fd151640127d3f90aec5b8766cacb0317d8e3609e4ca1b7fd460da0b01dfe')
sha256sums_x86_64=('3bfe7f389ac58e226f9dd163d57f11e8041a634d36bcb5303b2bb6cd57716a08')
sha256sums_i686=('8164b1353af0bdd4d0e899c60da06c5091c5f1d11cce6640319aeacb0507f0b9')
sha256sums_arm=('ff14d9ecb7e355245313dab04392481cf3c674681b21e863ba951e2120a78ec4')
sha256sums_armv6h=('48130d33071ed3b873570a9c6472dde2af9a19d8f243b0ce51e236e8c7a7a1f8')
sha256sums_armv7h=('3eeca8b27ef205843bc6b197d2b4bf7f5783574c0eba183ff7a621fb33b2f9a4')
sha256sums_aarch64=('d87b5ef4a96245cf7a897f303ef3827cd5e7d5680fef4278528d2d2f7ee727cd')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
