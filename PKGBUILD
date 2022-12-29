# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.31
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.31/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.31/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.31/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.31/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.31/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.31/tut-arm64-static")

sha256sums=('dc64e8ae81d87aad156a1a23b40c974c2dd4326cfe46ac149df30576305182a5')
sha256sums_x86_64=('b819b84b873fef562b9ec2e43ce30e1e65acb58759007055c9e41caa705dd5a4')
sha256sums_i686=('ccad97476a50d32dbcfbbbb487ecaddb6ba1efae11bf03ba750150dba605061b')
sha256sums_arm=('65ba067a9bac376864a019e33927f6b1883fa42625088e0e5f327cd60fa12ac6')
sha256sums_armv6h=('7cbd8adb912ef7c1d1e1ad01823c7e6c86a6037608df843c49c6d8113a0a96b9')
sha256sums_armv7h=('638156c3c86411a4e6ef08e1ce45a9a563f59eb0e70fa9f8550c4792d5623565')
sha256sums_aarch64=('f9e27dfc4752370e6ba3dfac52117486abdde8a0f8d0358bdbca3f84a1f710e5')

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
