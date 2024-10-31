# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=notmuch-deduplicate-git
pkgver=r4.76bc091
pkgrel=1
pkgdesc="Deduplicate Maildir using Notmuch"
arch=('any')
url="https://github.com/esovetkin/notmuch-deduplicate"
license=('BSD')
depends=('notmuch' 'pv' 'parallel' 'bash' 'jq')
makedepends=('git')
sha256sums=('SKIP')
provides=('notmuch-deduplicate')
source=('git+https://github.com/esovetkin/notmuch-deduplicate.git')


_gitroot=git://github.com/esovetkin/notmuch-deduplicate
_gitname=notmuch-deduplicate

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"

  # Install the program
  install -Dm755 notmuch-deduplicate "${pkgdir}/usr/bin/notmuch-deduplicate"
}

# vim:set ts=2 sw=2 et:
