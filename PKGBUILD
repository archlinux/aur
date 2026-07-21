pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.7.7
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('MIT')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.7/synchrogit-v26.7.7-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.7/synchrogit-v26.7.7-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('fd2008a68e4ecdd87bd6cb4fdb1b13ab0df8fd039f9e91fedc3e9a94327d4f54')
sha256sums_aarch64=('65166d9d5d7605e1e41db3aa88a98963e782866cc56de987eed83c84a03fbdbe')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/synchrogit.service" "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 "$srcdir/synchrogit@.service" "$pkgdir/usr/lib/systemd/system/synchrogit@.service"
  install -Dm644 "$srcdir/config.example.toml" "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
