# Maintainer: Youkou Tenhouin <youkou@tenhou.in>

pkgname=('vistathemeplasma-icons-git')
pkgver=5.rcbe92a7
pkgrel=1
pkgdesc="Icon theme designed for VistaThemePlasma"
license=('AGPL-3.0-or-later')
arch=(any)
url="https://gitgud.io/aeroshell/vtp/vistathemeplasma-icons"
makedepends=('git')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!debug')
conflicts=(vistathemeplasma-icons)
provides=(vistathemeplasma-icons)
groups=(vistathemeplasma)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%}"
  rm LICENSE
  rm README.md
  rm CMakeLists.txt
}

package() {
  install -dm 755 "$pkgdir"/usr/share/icons/
  cp -r ${srcdir}/${pkgname%}/* ${pkgdir}/usr/share/icons/
}
