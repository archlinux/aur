pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.9.5
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('MIT')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.9.5/synchrogit-v26.9.5-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.9.5/synchrogit-v26.9.5-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('c1c5782c58f2d5b74dd0d521631f05da206daf10e6f667e35c76817d8677dddb')
sha256sums_aarch64=('ad9156ceb15cc27a296ae3f78f19b1051b9f6fcd4e769f5490571a2ab290a58e')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/THIRD_PARTY_LICENSES.html" "$pkgdir/usr/share/doc/$_pkgname/THIRD_PARTY_LICENSES.html"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/synchrogit.service" "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 "$srcdir/synchrogit@.service" "$pkgdir/usr/lib/systemd/system/synchrogit@.service"
  install -Dm644 "$srcdir/config.example.toml" "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
