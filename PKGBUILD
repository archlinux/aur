# Maintainer: Cezary Drożak <czarek at drozak dot net>

pkgname=great-imd-evo-git
pkgver=r9.70c782b
pkgrel=2
pkgdesc='Great-IMD-evo is an sgi variation GTK2/3 theme.'
arch=('any')
url='https://github.com/sylphenix/Great-IMD-evo'
license=('GPL3')
makedepends=('git')
source=("${pkgname}::git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"

  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
    cd "$pkgname"
    local dest="$pkgdir"/usr/share/themes/'Great IMD evo'

    install -d "$dest"
    cp -r * "$dest"
}

# vim: ts=4 sw=4 ft=sh
