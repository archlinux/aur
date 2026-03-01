# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('aerothemeplasma-sounds-git')
pkgver=4.r55d2f5f
pkgrel=1
pkgdesc="Collection of sound themes designed for AeroThemePlasma"
license=('AGPL-3.0-or-later')
arch=(any)
url="https://gitgud.io/aeroshell/atp/aerothemeplasma-sounds"
makedepends=('git')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!debug')
conflicts=(aerothemeplasma-sounds)
provides=(aerothemeplasma-sounds)
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
  install -dm 755 "$pkgdir"/usr/share/sounds/
  cp -r ${srcdir}/${pkgname%}/* ${pkgdir}/usr/share/sounds/
}
