# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=asciiquarium-transparent-git
pkgver=r15.653cd99
pkgrel=1
pkgdesc="An aquarium/sea animation in ASCII art (with option of transparent background)"
arch=("any")
url="https://github.com/nothub/asciiquarium"
license=("GPL2")
depends=("perl" "perl-term-animation")
makedepends=("git")
provides=("asciiquarium")
conflicts=("asciiquarium")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/asciiquarium" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/asciiquarium" || exit 1
  install -Dm755 "asciiquarium" "${pkgdir}/usr/bin/asciiquarium"
}
