# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.10
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.10/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.10/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.10/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.10/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.10/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.10/tut-arm64-static")

sha256sums=('010e4d87bcae72b03c3f2fcf1396f9a1d0271d323abb9f27099dbdc1e1137245')
sha256sums_x86_64=('cde8bbf7f4e46ec477322b7efb25eac8e4394925b2806c58948efeb4a0436c75')
sha256sums_i686=('567208b21de19f1464be5e656ac38faaed96348b666f3aefe448ef607b12a6e5')
sha256sums_arm=('c97e7a7ba67cf36399a42efc6a0f0e992bd76bbf009a33b3011c39d225b54756')
sha256sums_armv6h=('310d133fa538f8269034cc05b63ed8cbda68b650a8861f3fbf530cf5c04f1fa4')
sha256sums_armv7h=('c4971499d016e589b83eacc831916088c04f35874e151d971739149bd41cd377')
sha256sums_aarch64=('9676c9627a1289042caf59260affcfe5201ed8992c8b4bb40e65d62ea076db36')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
