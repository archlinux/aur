# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.1/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.1/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.1/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.1/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.1/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/2.0.1/tut-arm64-static")

sha256sums=('afa8c49036461a36c091d83ef51f9a3bbd938ee78f817c6467175699a989b863')
sha256sums_x86_64=('13f17c4d63cd9376d908aa119711e4df0923264dc4b474e41260f153e9697205')
sha256sums_i686=('4142adbc07e86a415d0a06c5e39ea290b38bc598e0602d80a21dca04865fe014')
sha256sums_arm=('67e6f9dc0a47c2cdca5701f9b394d5d69035d5b5eaea27254b28eb5c7ade6756')
sha256sums_armv6h=('58676691949fd51bb623beda6dbcfc83674621e2ada8becc225628f41efc7780')
sha256sums_armv7h=('b6bb66e7f764710a1f5a6f6c7edc68d809764e1f8b04d34520126eaad26b80c3')
sha256sums_aarch64=('452393cbe84f662e8d6b9a6aa0683ed5b76681997c1058f189252b8a11917527')

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
