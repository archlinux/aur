# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-notes
pkgver=1.0.4
pkgrel=1
pkgdesc="Terminal-based note-taking application"
arch=('x86_64')
url="https://github.com/felipealfonsog/TermNotes"
license=('MIT')
depends=('gcc' 'vim' 'nano' 'neovim' 'libutil-linux' 'coreutils')

#https://github.com/felipealfonsog/TermNotes/archive/refs/tags/v.1.0.4.tar.gz
source=("https://github.com/felipealfonsog/TermNotes/archive/refs/tags/v.${pkgver}.tar.gz")

build() {
  cd "$srcdir/TermNotes-${pkgver}/src"
  gcc -o term-notes term_notes_linux.c
}

package() {
  cd "$srcdir/TermNotes-${pkgver}/src"
  install -Dm755 term-notes "$pkgdir/usr/bin/term-notes"
}

sha256sums=('ee0993e675697753282e874a79bce68fb433b1ecd1ca87736737ebbfba477558')
