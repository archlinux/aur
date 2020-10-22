# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: mocihan <ly50247@126.com>

pkgname=just-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='A handy way to save and run project-specific commands'
arch=("x86_64")
url="https://github.com/casey/just"
license=('custom:CC0')
provides=('just')
conflicts=('just')
changelog="$pkgname.changelog"
source=("https://github.com/casey/just/releases/download/v${pkgver}/just-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
b2sums=('d23966db6f4218b481e5dce1f25c54fbef35f9b33ee026f39dda9f5b1c5de0221efa54716961097a066af959769e9b5ed6bb2e3b7e1efe9fb0cda4b018436df8')

package() {
  cd "$srcdir"
  install -Dm755 just "$pkgdir/usr/bin/just"
  install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/just/GRAMMAR.md"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/just/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/just/LICENSE"

  install -dm755 "$pkgdir/usr/share/man/man1"
  gzip -c --best just.1 > "$pkgdir/usr/share/man/man1/just.1.gz"
}
