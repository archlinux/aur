# Maintainer: Shatur95 <genaloner@gmail.com>

pkgname=('antu-icon-theme-git')
pkgver=0.8.r3.g4a801b4
pkgrel=1
pkgdesc="A smooth theme designed for Plasma Desktop"
arch=('any')
url="https://github.com/fabianalexisinostroza/Antu-icons"
license=('Creative Commons')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%}"
  rm LICENSE.md
  rm README.md
}


package() {
  install -dm 755 "$pkgdir"/usr/share/icons/Antu
  cp -r ${srcdir}/${pkgname%}/* ${pkgdir}/usr/share/icons/Antu/
}
