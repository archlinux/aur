# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.34
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.34/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.34/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.34/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.34/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.34/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.34/tut-arm64-static")

sha256sums=('4340e41395cb8cf56e11f500738ef85b838dbfeddf219c988a058e4789009a69')
sha256sums_x86_64=('0a11825af1e26141343696a0b1bd67f6c1a932606387c44ba2731ee93c275d13')
sha256sums_i686=('ad92ef3ad5dde22f9eda494c94cd605a47322a1c2fd4714f77025bdf96cd3c82')
sha256sums_arm=('3d0c59492ca6c1436c32a41716b89ef00c0901a7963c89502bb0002b7c338ea4')
sha256sums_armv6h=('4c180f8fd635e8a751c495db457b9e9110370a7923c4ca77c627a124021429b2')
sha256sums_armv7h=('d6d32f603194fa059173c215fd271fe9b379e55a1a089250ff09ff162cddf135')
sha256sums_aarch64=('896323f1b6e463037850978b973c2a1e464b9246b51c775c2e0c82edbf5f4b42')

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
