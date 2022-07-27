# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.15
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.15/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.15/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.15/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.15/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.15/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.15/tut-arm64-static")

sha256sums=('e93756d6bb64509ec97cc4f489593bfba2672685f0496732b44594edccec6f78')
sha256sums_x86_64=('fddb4cdfd72860465afbdf4efb06e9ab7e9c6ba82bfa12acc82a3a4b08ac83fc')
sha256sums_i686=('10115be5a396a64bdc5fd5d1560671d80c74c342a4ef244e0d874a723a9fba13')
sha256sums_arm=('3f0e1d25dcae3e514479c2fd0ef2d469371b12b4c3ebe82081dcc73de27f1633')
sha256sums_armv6h=('5506fbc42d5fdb5599263c3ae75b78aee946fc0766c9c49f0597e11a9cae949d')
sha256sums_armv7h=('d1c72399edcd4b6d11d54477585b090b5e5d25c8a7eed00588bb8ee7e16754e3')
sha256sums_aarch64=('b7b5c58c8727a47903dd5d12be3fbfd6dacad9fae155ba720a7bcbdc9fc466d7')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
