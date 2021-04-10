# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: mocihan <ly50247@126.com>

pkgname=just-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='A handy way to save and run project-specific commands'
arch=('x86_64')
url='https://github.com/casey/just'
license=('custom:CC0')
provides=('just')
conflicts=('just')
changelog="$pkgname.changelog"
source=("https://github.com/casey/just/releases/download/v${pkgver}/just-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
b2sums=('d4340574790b9f18dc5f14da7286eafbc1c111e4eed8281b38eaf95401f430929a815bb4ee3c63867080e60ea4cbb4850ce87ba26176329e9db3ee40fd93856a')

package() {
  cd "$srcdir"

  install -Dm755 just "$pkgdir/usr/bin/just"
  install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/just/GRAMMAR.md"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/just/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/just/LICENSE"
  install -Dm644 just.1 "$pkgdir/usr/share/man/man1/just.1"
}
