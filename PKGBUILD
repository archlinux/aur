# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=bash-preexec
pkgver=0.4.1
pkgrel=1
pkgdesc="⚡ preexec and precmd functions for Bash just like Zsh."
arch=('any')
url="https://github.com/rcaloras/bash-preexec"
license=('MIT')

makedepends=('bash-bats')
#depends=()
provides=('bash-preexec')
conflicts=('bash-preexec-git')

source=("$pkgname-$pkgver::https://github.com/rcaloras/bash-preexec/archive/0.4.1.tar.gz")
install=$pkgname.install
sha256sums=('5e6515d247e6156c99a31de6db58e9cbef53071806292a1ca10b7af74633a8c9')

check() {
  cd "$srcdir/$pkgname-$pkgver/test"
  bats .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m0755 -t "${pkgdir}/usr/share/${pkgname}" \
    "${pkgname}.sh"
  install -D -m0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "LICENSE.md"
}

# vim: set noet ts=4:
