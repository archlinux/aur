# Maintainer: Nikita Boldasov <renom7 at gmail dot com>

pkgname=sub3dtool-git
_pkgname=sub3dtool
pkgver=r6.668216a
pkgrel=2
pkgdesc="Convert subtitle to 3D (ASS Format) to use with VLC or MPlayer"
arch=("x86_64")
url="https://github.com/TheZoc/sub3dtool"
license=("GPL3")
depends=()
makedepends=("git")
provides=("sub3dtool")
conflicts=("sub3dtool")
source=("$_pkgname::git+https://github.com/TheZoc/sub3dtool.git")
sha512sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -D -m 0755 sub3dtool ${pkgdir}/usr/bin/sub3dtool
}
