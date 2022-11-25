# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.22
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.22/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.22/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.22/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.22/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.22/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.22/tut-arm64-static")

sha256sums=('ca80cdb679d8e255e15d037306c6ecbbe48f2d1a2ef8517cfaf41726e3967285')
sha256sums_x86_64=('7b2b38d5dc49dfb75da8db6671dd43ec325c9cf49f1f2e6537f7b394c926610e')
sha256sums_i686=('7486fd3818c5c5f79110f5683adcecd0668c9ff8d47c1de17faa4dd6e58f86df')
sha256sums_arm=('4a48d2e53ff8b2dbcc64025716d5a43d1eaebb93c9b11dbbd52814711618eda9')
sha256sums_armv6h=('8b65e027f6e7c546eb82913872f7e43bbc94ec3e67b4e73a5fb120c932e11904')
sha256sums_armv7h=('382b53f89f8e38b803b01b4f7ada160c820f9ec4f385321b97b65ba2279e7fc9')
sha256sums_aarch64=('c594a9ba561f185b6e555d76ae0029d15db2b0f7a7c17bf5f8e13988d0812a92')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
