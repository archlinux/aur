# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.17
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.17/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.17/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.17/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.17/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.17/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.17/tut-arm64-static")

sha256sums=('b92da4aa1bf36d77657b76149262f7fdb731d83111b81a69d3b017179c4319a1')
sha256sums_x86_64=('88bfae81a4aa5010d6f8612fba47d4bd0cf9e01e23ca697428572498872c87db')
sha256sums_i686=('51f3a36df95240c85c4f92ba77059a1c76891ae3e3bf440dea6b7c3189c209b3')
sha256sums_arm=('59f9e901fdf8448194308d56fb272b88e65f8e2b2d6c2ed12702e59e1e55ed75')
sha256sums_armv6h=('ff87889ed30f6716021fe6a46ba8c5d333fdb59c80b573385e200763b2b7fee7')
sha256sums_armv7h=('e2144437e7e37dbbcf93f9b778cab00cc57812e3d98396516a6587c4883998a2')
sha256sums_aarch64=('40bcc72d7ca8d6aedf4da41255eb4da26e772b4cb21bac18ae12dc833d056ef0')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
