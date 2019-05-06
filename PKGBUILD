# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive-community-effects-git
_pkgname=Olive-Editor-Community-Effects
pkgver=r59.65b96e0
_commit=65b96e0
pkgrel=2
arch=('any')
pkgdesc="A collection of effects for Olive made by the community"
url="https://github.com/cgvirus/$_pkgname"
license=('unknown')
depends=('olive')
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
