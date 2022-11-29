# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.24
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.24/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.24/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.24/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.24/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.24/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.24/tut-arm64-static")

sha256sums=('9d4f75dbf5a7d1ad9e2857838612a507eed4d297cfdfe59bef48856127bb6efb')
sha256sums_x86_64=('0e39aa86ff26959ead207ba9c85cdb260614cf9f0962bf3fd76a3b737bd0d933')
sha256sums_i686=('8e9a3fc114a4df5c4165fb9c1c7e986bb565878baeeeb47cae3259a9c8c728f3')
sha256sums_arm=('5cbc205677d46964946c0465a1936c94f8a4384d73d76fde81b9fbb4a85e424f')
sha256sums_armv6h=('ca71b96ea0b850050581bc0c615c89196c5fea4390e23f04b16d76b8968284b1')
sha256sums_armv7h=('d7955a312072a87a1a47090af409074aefc8cbaa1793aa62bc5a70e8a665b4d9')
sha256sums_aarch64=('7fe3ec00eed3a045fc810eb9c1de0564f303c1e1902883de4d5f0345606b5383')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
