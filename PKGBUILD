# Maintainer: Youkou Tenhouin <youkou@tenhou.in>

pkgname=('vistathemeplasma-sounds-git')
pkgver=1.rdabc6bf
pkgrel=1
pkgdesc="Collection of sound themes designed for VistaThemePlasma"
license=('AGPL-3.0-or-later')
arch=(any)
url="https://gitgud.io/aeroshell/vtp/vistathemeplasma-sounds"
makedepends=('git')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!debug')
conflicts=(vistathemeplasma-sounds)
provides=(vistathemeplasma-sounds)
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
  install -dm 755 "$pkgdir"/usr/share/sounds/
  cp -r ${srcdir}/${pkgname%}/* ${pkgdir}/usr/share/sounds/
}
