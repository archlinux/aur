# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive-community-effects-git
_pkgname=Olive-Editor-Community-Effects
pkgver=r57.043abef
_commit=043abef
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A collection of effects for Olive made by the community"
url="https://github.com/cgvirus/$_pkgname"
license=('unknown')
depends=('olive-git')
makedepends=('git')
source=("git+$url#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/olive-editor/effects/$_pkgname"
  cp -r --preserve=mode,timestamps \
        $srcdir/$_pkgname/* \
        $pkgdir/usr/share/olive-editor/effects/$_pkgname/
}
