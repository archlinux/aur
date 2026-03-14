# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aerothemeplasma-icons-git')
pkgver=8.rb8d5ce1
pkgrel=1
pkgdesc="Icon theme designed for AeroThemePlasma"
license=('AGPL-3.0-or-later')
arch=(any)
url="https://gitgud.io/aeroshell/atp/aerothemeplasma-icons"
makedepends=('git')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!debug')
conflicts=(aerothemeplasma-icons)
provides=(aerothemeplasma-icons)
groups=(aerothemeplasma)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%}"
  rm LICENSE
  rm README.md
}


package() {
  install -dm 755 "$pkgdir"/usr/share/icons/
  cp -r ${srcdir}/${pkgname%}/* ${pkgdir}/usr/share/icons/
}
