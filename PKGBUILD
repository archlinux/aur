pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.7.4
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('GPL-3.0-or-later')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.4/synchrogit-v26.7.4-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.4/synchrogit-v26.7.4-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cb6760bdd732ccb5c7c74baa175459a1edbd18ceddc84aef18facfff3f4c8675')
sha256sums_aarch64=('17932f996851beb258ff31895e8e6e60f9f8f2aa194957b45f9daee6f2eddd75')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/synchrogit.service" "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 "$srcdir/config.example.toml" "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
