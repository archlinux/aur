pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.9.3
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('MIT')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.9.3/synchrogit-v26.9.3-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.9.3/synchrogit-v26.9.3-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('74ed8326b51cfb971e4b767ac1810906756bc13fefb5ceaa20a6b52d12ffe0d6')
sha256sums_aarch64=('48d00afba9deb6461f92f3c85c6ce6579a39c759cda9192f1f9abfdbf2d40b7c')

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
