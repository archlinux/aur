# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

_gistid=91ff81bd945eb8f1e6af08492a13ff75
pkgname=asciiquarium-transparent-git
pkgver=r14.fd96f95
pkgrel=1
pkgdesc="An aquarium/sea animation in ASCII art (with option of transparent background)"
arch=("any")
url="https://gist.github.com/nothub/${_gistid}"
license=("GPL2")
depends=("perl" "perl-term-animation")
makedepends=("git")
provides=("asciiquarium")
conflicts=("asciiquarium")
source=("git+https://gist.github.com/nothub/${_gistid}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gistid}" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_gistid}" || exit 1
  install -Dm755 "asciiquarium.pl" "${pkgdir}/usr/bin/asciiquarium"
}
