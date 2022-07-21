# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.14
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.14/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.14/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.14/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.14/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.14/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.14/tut-arm64-static")

sha256sums=('3184313084bc3ee4e991466832af85009d82e9f09c8f574764472ed9cd898903')
sha256sums_x86_64=('8ca1a890d93079d03725c703bd7b3b9b32a00229faaf321bc3ef4eab1446aeaa')
sha256sums_i686=('59692a25d95fd61372329295d1f1bda429461893076e7a97fcc3c03b3c46fd84')
sha256sums_arm=('fd097a39ef36f01f449857dc5a0cd8804891a4ced14397f415ff259f02c7716c')
sha256sums_armv6h=('f09f7980e4f405b898fb3c1d11c1789eb6cf5045843aea26320fcdd0d96a9035')
sha256sums_armv7h=('858b3b28faf52e2b63ad7e809c1fc6d1dae0ade1cbbc01cacf1b882510f42ca0')
sha256sums_aarch64=('04a33973b4e59b57d2747eca96be5390be64675b082f14ddf82ede121e948bc9')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
