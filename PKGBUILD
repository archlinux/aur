# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.30
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.30/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.30/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.30/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.30/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.30/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.30/tut-arm64-static")

sha256sums=('404f1d6647920fc32fab02c92ee23ab4a7e2c7507d535669c4e5a29075d480b1')
sha256sums_x86_64=('07a3a7db005f6e74bae29520cb47537c848d199ffaabd4a79fb826d0db2d98df')
sha256sums_i686=('8695761620e6a8ebc88f4c28c21e444eae1195c1f0cd58e339593adf70963f39')
sha256sums_arm=('ef5664b8e8aa8b4d49e87449c9bea6c1c360730f15c2a1bf5fc4fdc8e0a6c96e')
sha256sums_armv6h=('fa8c06d023aac3cce90d9e831499e19cf9456ac3a5dee0d6aae5a38bf57db237')
sha256sums_armv7h=('6f383716ff660aee23d873541e3c36e2be5dbe6d20cf6fa0925ac84f47c342ed')
sha256sums_aarch64=('0edb6dd0c66a36ff027f6c0d15d73290066a7062d3616d7eca4cdfdf6f1055b5')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
