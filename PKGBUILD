pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.7.3
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('GPL-3.0-or-later')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.3/synchrogit-v26.7.3-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.3/synchrogit-v26.7.3-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ea36d835a2d31212c4c410b51060b9ef30a974be657384a54a65fbcb1830d8d0')
sha256sums_aarch64=('0d9b75fd1008a90c83e100eabd8078d06fd8f91cdb1439d473f400148e8d1b58')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/synchrogit.service" "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 "$srcdir/config.example.toml" "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
