# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=mail2rem-git
pkgver=r20.7f8e8a5
pkgrel=1
pkgdesc="A script that searches *.ics in your mail and puts events to your Remind calendar"
arch=('any')
url="https://github.com/esovetkin/mail2rem"
license=('BSD')
depends=('notmuch' 'gawk' 'sed' 'ical2rem' 'ripmime' 'bash')
sha256sums=('SKIP')
optdepends=('remind')
makedepends=('git')
provides=('mail2rem')
source=('git+https://github.com/esovetkin/mail2rem.git')


_gitroot=git://github.com/esovetkin/mail2rem
_gitname=mail2rem

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"

  # Install the program
  install -Dm755 mail2rem "${pkgdir}/usr/bin/mail2rem"
}

# vim:set ts=2 sw=2 et:
