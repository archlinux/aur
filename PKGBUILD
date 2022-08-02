# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.16
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.16/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.16/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.16/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.16/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.16/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.16/tut-arm64-static")

sha256sums=('02cf6d76bf261bb6466678a4690ee92e4bf94ec3e916b23a0609d2f229b3d97d')
sha256sums_x86_64=('f31e290503ccd1f63ff83880ed7b6c7a17235122ec0fe59f8cfd84c87213b836')
sha256sums_i686=('e40039d47021f4b4b64f564684520ed7df34858fdf421470bb35d4c4059cbc77')
sha256sums_arm=('aa225b1f8d10f6201058c4a3f35efed4706258136a688ca4a8cb17c82337b920')
sha256sums_armv6h=('ab0d5ebdc9b5d37114ccccc2a7d5445df727936ceb511880aa887ab76f072a98')
sha256sums_armv7h=('1dfa96c19c8e0335caeba14b48899c47c1139adf535e614bb8d1b1c7b17872a3')
sha256sums_aarch64=('31d0f2d91837095f8ea6a9f5a82e6227fe3a27cfda532c53a9fa1845be53112a')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
