# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: tuxce <tuxce.net@gmail.com>

_pkgname=aurvote
pkgname=$_pkgname-git
pkgver=1.9.r7.gfd413f1
pkgrel=1
pkgdesc='Tool to vote for your favorite AUR packages (development version)'
url="https://github.com/archlinuxfr/aurvote"
license=('GPL')
arch=('any')
depends=('curl')
makedepends=('git')
conflicts=('aurvote')
provides=('aurvote')
source=("git+https://github.com/archlinuxfr/aurvote.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  # Install the program.
  install -Dm755 aurvote "${pkgdir}/usr/bin/aurvote"
  install -Dm644 zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_aurvote"
}

# vim: ft=sh ts=2 sw=2 et
