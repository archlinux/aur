# Maintainer: Chris Longros <chris.longros@gmail.com>
pkgname=anki-snapshot
pkgver=1.2
pkgrel=1
pkgdesc="Git-based version control for Anki collections"
arch=('any')
url="https://github.com/chrislongros/anki-snapshot"
license=('MIT')
depends=('git' 'git-lfs' 'sqlite' 'perl')
optdepends=('anki: Anki flashcard application')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrislongros/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b2c0ce2809791faa8a044b7fd9e340a1c3c31c5bfc7898b80b5f840628df8803')

package() {
    cd "$pkgname-$pkgver/bash"
    install -Dm755 anki-snapshot "$pkgdir/usr/bin/anki-snapshot"
    install -Dm755 anki-diff "$pkgdir/usr/bin/anki-diff"
    install -Dm755 anki-log "$pkgdir/usr/bin/anki-log"
    install -Dm755 anki-search "$pkgdir/usr/bin/anki-search"
    install -Dm755 anki-restore "$pkgdir/usr/bin/anki-restore"
    cd ..
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
