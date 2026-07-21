pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.7.5
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('GPL-3.0-or-later')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.5/synchrogit-v26.7.5-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.5/synchrogit-v26.7.5-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('f8630400a48c0a7cf59047a3914cc09d504bfc754a76ef71a53e9f3a4274704c')
sha256sums_aarch64=('a9cd615287bb0dec56d198d0835ba8e3c74b5a3007c3fe2ceeeb395ea25ed3cf')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/synchrogit.service" "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 "$srcdir/config.example.toml" "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
