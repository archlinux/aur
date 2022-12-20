# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.29
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.29/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.29/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.29/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.29/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.29/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.29/tut-arm64-static")

sha256sums=('f4c9ba33d999924689eebad055b512308ac3aaf03167b3ec50a5a420ae0645f0')
sha256sums_x86_64=('53cb4413124884a8d5f8621849c8c1d95fe61bd44d93ae6b24e7642fea7544ed')
sha256sums_i686=('0c2d5e54e9a074572f06f6c874b4138d931da5f43d112e934e547841ab2708c3')
sha256sums_arm=('66c4a61ecb71fdaf6a0d4c9efa88297ab1fc4e8624a1e99f9b8ebb8e470ab31d')
sha256sums_armv6h=('60454ec1faafa49f2e437bb0551451e02facf7af78456b4ced8685b2fd3b4c05')
sha256sums_armv7h=('623eb123d7aee0ce01155efd21933e0f2c30520443983b407b1f1dbe39ef9468')
sha256sums_aarch64=('40ae0df23a72a0e0b3424df8953f805b84d9830581ab3891d6d5bf202bf9bb1d')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
