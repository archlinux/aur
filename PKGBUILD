pkgname=synchrogit-bin
_pkgname=synchrogit
pkgver=26.7.2
pkgrel=1
pkgdesc='Daemon that keeps git repositories synced with their remotes (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/synchrogit'
license=('GPL-3.0-or-later')
depends=('git')
provides=("synchrogit=$pkgver")
conflicts=('synchrogit')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.2/synchrogit-v26.7.2-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz::https://github.com/partanskiy/synchrogit/releases/download/v26.7.2/synchrogit-v26.7.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5af578f24156f73743974aa87c1bc35838da9a55fb38d80d3eb832934dd9e781')
sha256sums_aarch64=('f61041922e59808dba042fa011ea7c418aa2eee14f98ce0451edcb568ac9ffa9')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/synchrogit.service" "$pkgdir/usr/lib/systemd/user/synchrogit.service"
  install -Dm644 "$srcdir/config.example.toml" "$pkgdir/usr/share/doc/$_pkgname/config.example.toml"
}
