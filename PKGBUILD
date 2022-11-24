# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.21
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.21/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.21/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.21/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.21/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.21/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.21/tut-arm64-static")

sha256sums=('64139c3e8f5873d78e0044f158bf9070b18e0a96cb7ae48a350d75476d9073e9')
sha256sums_x86_64=('b677aec8c4008726809357f8cd448c783e6b5e4e1f5564dfceb0c30abc9c7516')
sha256sums_i686=('1c1fac91bac0cd2171a0c6c4f9141fa31519841183eab79c65136075ef4de6da')
sha256sums_arm=('f437d35b6983f77d8a6ca73209e615404213841253576e8766bfefc2e8e9ac63')
sha256sums_armv6h=('500e8840c9a45000fcb5ac55d95214dc3e298832d5e84aeba92213e8a8080c52')
sha256sums_armv7h=('894c115244aada2c354aeec99dfcc483a07c7bb9db2ab2127495038b21eca2e9')
sha256sums_aarch64=('59d797e91f735675234cb0f940f874869ea86f9ce392a9f5195734f31053e779')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
