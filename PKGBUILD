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

build() {

  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1

  cd "$srcdir"/TermNotes-v."$pkgver"

  gcc -o term-notes src/term_notes_linux.c
}

#Fixes 12.8.2023
package() {
  #cd "$srcdir/TermNotes-${pkgver}"
  cd "${srcdir}"/TermNotes-v."${pkgver}"
  install -Dm755 src/term-notes-linux "$pkgdir/usr/bin/term-notes"
}

sha256sums=('ee0993e675697753282e874a79bce68fb433b1ecd1ca87736737ebbfba477558')
