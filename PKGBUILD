# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.11
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.11/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.11/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.11/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.11/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.11/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.11/tut-arm64-static")

sha256sums=('9b039109fc1af188ae8f6d92f511d76e6d71b3901fb2d2df8000b6c888c83829')
sha256sums_x86_64=('41562f71e065a9d126235bf1f1c5a27dace1639e96bb520d4d75476c3a0a372c')
sha256sums_i686=('d33dbfc049ec98ded75a32b1e98c40ce27533e8688c3b98b9031760c6ab71725')
sha256sums_arm=('b23348e903c71364b1fba7fef2bc5d992d4a6a2814d28b30e8bffbb15f23f6c3')
sha256sums_armv6h=('9b67274346f04b0d08410adb8c626eb4aa512dc0561aa209f4e34b2f573e5cec')
sha256sums_armv7h=('82af56c09d9ffe8083249841cd50209ac1e76fbe36fc077ff1ebec3d5170cf1f')
sha256sums_aarch64=('790b48d306ffad5c0d9bca65589809094e46916cff239678ea07a1bb1aebe01d')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
