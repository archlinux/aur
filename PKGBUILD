# Maintainer: orumin <dev at orum.in>

pkgname=slack-term
pkgver=0.3.0
pkgrel=1
pkgdesc="Slack client for your terminal"
arch=('x86_64')
url="https://github.com/erroneousboat/slack-term"
source=("git+$url"
        "$url/releases/download/v${pkgver}/slack-term-linux-amd64")
sha256sums=('SKIP'
          'bc669111389a0c4cc244d9e5eb0660c75a7d946c00e6986f3238e9103f0bd42c')
license=('MIT')
makedepends=('git')
options=('!strip' '!emptydirs')

prepare() {
  cd "$srcdir/$pkgname"
  git checkout v$pkgver
}

package() {
  install -p -Dm755 "$srcdir/slack-term-linux-amd64" "$pkgdir/usr/bin/slack-term"

  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
