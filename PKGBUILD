pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.7.1
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('GPL-3.0-or-later')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.1/synchrogit-v26.7.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.1/synchrogit-v26.7.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('2e5b869eb4b922789a2e6b1fd3c3b0cd329b975ed5412c59328a4ad0566de99c')
sha256sums_aarch64=('ae929b4a3c8d0329e6cb184a9b66dbe67c88406c6d90f69189d937fb2503709f')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/synchrogit.service" "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 "$srcdir/config.example.toml" "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
