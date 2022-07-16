# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.12
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.12/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.12/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.12/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.12/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.12/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.12/tut-arm64-static")

sha256sums=('bc272237d5874d686fdb812b5a5a594af6813058406a58dc2053451af4d6448e')
sha256sums_x86_64=('c9b77371b30b76cd16409b49beaa24c4a72fa0101dfaddc7b53f364dea18efa6')
sha256sums_i686=('13a80bf895dcf3b096958c09219a9b7aaab400b1ef9d3b76d13b896439e8e35e')
sha256sums_arm=('fe77689734f36b9469947bdfb7a195afeb85ef1ceed9aa53c93cddb66d62679f')
sha256sums_armv6h=('7d809288a887874dcd26fa22ed56ed635e14bc681e3d3449ff5a4151d1905fbc')
sha256sums_armv7h=('7c01cb4c487bb5bb2d77c8ef23e388e8f5506862372d390e9cc60e4e8e4b05bd')
sha256sums_aarch64=('4a4af343930370312f770c3b19735acab52ca81f250617e519e64233fbea7cb2')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
