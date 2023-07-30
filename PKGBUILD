# PKGBUILD
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
  bsdtar -xf "${srcdir}/v.${pkgver}.tar.gz"
  cd "${srcdir}/TermNotes-${pkgver}"  # Updated the directory name
  gcc -o term-notes src/term_notes_linux.c  # Adjusted the path for the C file
}

package() {
  cd "${srcdir}/TermNotes-${pkgver}"  # Updated the directory name
  install -Dm755 term-notes "${pkgdir}/usr/bin/term-notes"
}

sha256sums=('ee0993e675697753282e874a79bce68fb433b1ecd1ca87736737ebbfba477558')

