# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: tuxce <tuxce.net@gmail.com>

pkgname=aurvote-git
pkgver=1.9.r7.gfd413f1
pkgrel=2
pkgdesc='Tool to vote for your favorite AUR packages (development version)'
url="https://github.com/archlinuxfr/aurvote"
license=(GPL)
arch=(any)
makedepends=(git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname%-git}
  install -Dm755 aurvote "$pkgdir/usr/bin/aurvote"
  install -Dm644 bash-completion "$pkgdir/usr/share/bash-completion/completions/aurvote"
  install -Dm644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_aurvote"
}

# vim: ft=sh ts=2 sw=2 et
