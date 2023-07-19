# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-notes
pkgver=v.1.0.2
pkgrel=1
pkgdesc="Terminal-based note-taking application"
arch=('x86_64')
url="https://github.com/felipealfonsog/TermNotes"
sha256sums=('2b632c12461adc29c41c574499fd97024342df2b35faa7314537387f234f617d')
license=('MIT')
depends=('gcc' 'vim' 'nano' 'coreutils')

# https://github.com/felipealfonsog/TermNotes/archive/refs/tags/v.1.0.2.tar.gz
source=("https://github.com/felipealfonsog/TermNotes/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd "$srcdir/TermNotes-$pkgver/src"
  gcc -o term-notes term_notes.c
}

package() {
  cd "$srcdir/TermNotes-$pkgver/src"
  install -Dm755 term-notes "$pkgdir/usr/bin/term-notes"
}


