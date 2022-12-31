# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.33
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.33/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.33/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.33/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.33/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.33/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.33/tut-arm64-static")

sha256sums=('975efa73d985d59b6f8ae1322ab3da3555f6004eff5f0b9303413fc20850c02a')
sha256sums_x86_64=('8a3db244cd2655189996568ad9473fbb59fd8fbd68a88e4c18e8e2c58045ff93')
sha256sums_i686=('5c64c09effda0433140f5b558c69585575d29dc37e117496c82df0da7371313f')
sha256sums_arm=('46804ab41ade9193f5dbeb691454dc756a49e49a9328b159ae1c72c0cf0cbea4')
sha256sums_armv6h=('e0c7f1a977aa462b4492e636d1b8a7d09a69618ceba41559d263527b1ebebfdb')
sha256sums_armv7h=('1655f949b12597fe8f36ab7c00072cfb83a29fcfe23810db468b78c9728bb2ea')
sha256sums_aarch64=('7639b5628cc55a0c4a581c6c32f17f52a60f2175150525101785f95e95a055a0')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
  install -d "$pkgdir"/usr/share/doc/$_pkgname/themes/
  install -Dm644 config/themes/* "$pkgdir"/usr/share/doc/$_pkgname/themes/
  install -Dm644 docs/man/tut.1 "$pkgdir"/usr/share/man/man1/tut.1
  install -Dm644 docs/man/tut.5 "$pkgdir"/usr/share/man/man5/tut.5
  install -Dm644 docs/man/tut.7 "$pkgdir"/usr/share/man/man7/tut.7
}
