# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.0/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.0/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.0/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.0/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.0/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.0/tut-arm64-static")

sha256sums=('f0deeaf923c05b713a72a338684c54159a433952475656f8b46be6bc0d4489ca')
sha256sums_x86_64=('87d85a284e20dfe90070f701e553f8ddf0a9f564272723a23c1c059ba786292f')
sha256sums_i686=('130c07acea482dd58fc2a5a37342f667e345bb0278fc02dff8a6c0fc7273945c')
sha256sums_arm=('2180ce9cb47e1ad9998501013006b99b4dc460621f2ceba84aa0fed2aad161fd')
sha256sums_armv6h=('e6c0ad0c826bc87a68ba36aa34c29c07d77fd4bc7041e6e42c89f103bd47218c')
sha256sums_armv7h=('f037c5b71d537ec8b2ccfd4cb3de23fcb127f0770935784290933e05b5c4447e')
sha256sums_aarch64=('81e9796eec856e88201fb9b7cafe31311d610641806a58ace214d4ad1206874b')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.toml "$pkgdir"/usr/share/doc/$_pkgname/config.example.toml
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
  install -d "$pkgdir"/usr/share/doc/$_pkgname/themes/
  install -Dm644 config/themes/* "$pkgdir"/usr/share/doc/$_pkgname/themes/
  install -Dm644 docs/man/tut.1 "$pkgdir"/usr/share/man/man1/tut.1
  install -Dm644 docs/man/tut.5 "$pkgdir"/usr/share/man/man5/tut.5
  install -Dm644 docs/man/tut.7 "$pkgdir"/usr/share/man/man7/tut.7
}
