# Maintainer: dundee81 <daniel.winiarski.dw@gmail.com>

pkgname=('plasma-theme-helium-git')
pkgver=9.0.1
pkgrel=1
pkgdesc="A translucent theme for Plasma 5"
arch=('any')
url="https://github.com/mcder3/Helium-Plasma-Theme"
license=('Creative Commons')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname%}"
  rm -rf LICENSE.md
  rm README.md
}

package() {
  install -dm 755 "$pkgdir"/usr/share/plasma/desktoptheme/
  cp -r ${srcdir}/${pkgname%}/* ${pkgdir}/usr/share/plasma/desktoptheme/Helium/
}
