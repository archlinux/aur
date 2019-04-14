# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive-community-effects-git
_pkgname=Olive-Editor-Community-Effects
pkgver=r44.94b4b1a
_commit=94b4b1a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A collection of effects for Olive made by the community"
url="https://github.com/cgvirus/Olive-Editor-Community-Effects"
license=('unknown')
depends=('olive-git')
makedepends=('git')
conflicts=('olive')
source=("git+https://github.com/cgvirus/$_pkgname#commit=$_commit")
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
