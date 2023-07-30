# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-notes
pkgver=1.0.4
pkgrel=1
pkgdesc="Terminal-based note-taking application"
arch=('x86_64')
url="https://github.com/felipealfonsog/TermNotes"
license=('MIT')
depends=('gcc' 'vim' 'nano' 'neovim' 'libutil-linux' 'coreutils')

source=("https://github.com/felipealfonsog/TermNotes/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('ee0993e675697753282e874a79bce68fb433b1ecd1ca87736737ebbfba477558')

build() {
  mkdir -p "$HOME/.config/term-notes"
  tar xf "v.${pkgver}.tar.gz" -C "$HOME/.config/term-notes" --strip-components=1
  cd "$HOME/.config/term-notes/src"
  gcc -o term-notes term_notes_linux.c
}

package() {
  cd "$HOME/.config/term-notes/src"
  install -Dm755 term-notes "${pkgdir}/usr/bin/term-notes"
}

