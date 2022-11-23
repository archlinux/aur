# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.20
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.20/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.20/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.20/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.20/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.20/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.20/tut-arm64-static")

sha256sums=('eb7704b94aa1f0466c71f7cdac7ef385dbd0929f452edf2737b72c3d480c4dfa')
sha256sums_x86_64=('6065d5ca42a36df74e43c2b8367570208aab0ef395e3470144327389e824bd64')
sha256sums_i686=('da61c24a80d58ad7db6f7f808ea84f1627af21b7e1c91f516b521c90beef573c')
sha256sums_arm=('89434a9e12966d4e72cb3d4d845f75c9617501a90974b6c105982f793864f8af')
sha256sums_armv6h=('ae16cf5756aaa60ae21ed3642372a482f483f5bdc1866a66c3d987b0b5bbeefa')
sha256sums_armv7h=('8cc601f04d945de9def4a69eb9f4635ca13458bd610733e6ba53a0a704b7bc88')
sha256sums_aarch64=('dc1d01055f803171cdf3fc81d9ae47cd7c8bc2598bbdf7fd96e78b7f53060bf4')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
