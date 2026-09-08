pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.9.1
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('MIT')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.9.1/synchrogit-v26.9.1-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.9.1/synchrogit-v26.9.1-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('dadd71d7fbeb82811987bf0987c43fce089dc4d7326f3e783c799161b075ff0f')
sha256sums_aarch64=('071c204facb8e106bced64e79baeb872f8b21d474517707630da9d202efbff33')

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
