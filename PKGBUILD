# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Milo Mirate <mmirate@gmx.com>

pkgname=pipe2imap-git
pkgver=r2.477d4c7
pkgrel=1
pkgdesc="Appends a message from stdin to an IMAP mailbox."
arch=('any')
url="https://gitlab.com/mikecardwell/pipe2imap"
license=('GPL')
depends=('perl-imap-client')
makedepends=('git')
source=(git+https://gitlab.com/mikecardwell/pipe2imap.git)
md5sums=('SKIP')

pkgver() {
  cd pipe2imap
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd pipe2imap
  install -Dm755 pipe2imap.pl "$pkgdir/usr/bin/pipe2imap"
}