# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.19
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.19/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.19/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.19/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.19/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.19/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.19/tut-arm64-static")

sha256sums=('7f0ac34c8a5dbfacee3ee2729777fd62147721564f24cbbefcf450a9115c516c')
sha256sums_x86_64=('13d219c722fc0a2f7930d417ed90b341a8e1d5e5807ebd2ba3db0436cb85771a')
sha256sums_i686=('cf8f77949520bb56b074449e11fd36396b535e59c76dfab47aec566354826317')
sha256sums_arm=('9ca0511993c7670aedca130f6148c6b9e773894cfdc903d92a5f14de3f6b37d2')
sha256sums_armv6h=('2fd7fb29804893a444d2a8a3d7ce6d8e6f60149e7d2183bf33bebd7621481f47')
sha256sums_armv7h=('0aea3cdc908b648f39f32e21d4523e8bf8bd507728dfd69625822260b9f9a88c')
sha256sums_aarch64=('648a004fc17204472996aef8645e0e962b5bd2cc2d58d618cedbe5d182a2968c')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
