# Maintainer: Ismael González Valverde <ismgonval@gmail.com>

pkgname=rnr-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='A CLI tool to rename files and directories that supports regex. Compiled binary'
provides=('rnr')
arch=('x86_64')
url='https://github.com/ChuckDaniels87/rnr'
license=('MIT')
source=("https://github.com/ChuckDaniels87/rnr/releases/download/v$pkgver/rnr-v$pkgver-$arch-unknown-linux-gnu.tar.gz")
md5sums=('SKIP')

package() {
  cd "${pkgname}-v$pkgver-$arch-unknown-linux-gnu"

  # Binary
  install -Dm755 "rnr" "$pkgdir/usr/bin/rnr"
  # Completion files
	install -Dm644 "completion/_rnr" "$pkgdir/usr/share/zsh/site-functions/_rnr"
  install -Dm644 "completion/rnr.bash" \
    "$pkgdir/usr/share/bash-completion/completions/rnr"
  install -Dm644 "completion/rnr.fish" \
    "$pkgdir/usr/share/fish/completions/rnr.fish"
  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  # License files
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et:
