# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: mocihan <ly50247@126.com>

pkgname=just-bin
pkgver=0.7.3
pkgrel=2
pkgdesc='A handy way to save and run project-specific commands'
arch=("x86_64")
url="https://github.com/casey/just"
license=('custom:CC0')
provides=('just')
conflicts=('just')
source=("https://github.com/casey/just/releases/download/v${pkgver}/just-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
b2sums=('2fa8b71cc06faa660e3708192c404a889be1c33719cb0c01964132b48d04dd9c550bbe62e0dcef6d506d94b9990e81c0914f809b715a70d82b8811b7c74e0f8a')

package() {
  cd "$srcdir"
  install -Dm755 just "$pkgdir/usr/bin/just"
  install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/just/GRAMMAR.md"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/just/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/just/LICENSE"

  install -dm755 "$pkgdir/usr/share/man/man1"
  gzip -c --best just.1 > "$pkgdir/usr/share/man/man1/just.1.gz"
}
