# Maintainer: Lovis Rentsch <aur@lovirent.eu>
pkgname='todoscript-git'
pkgver=r9.72ea302
pkgrel=1
pkgdesc="a good looking todoscript"
arch=('x86_64')
url="https://github.com/BaerLKR/todoscript"
license=('EUPL')
depends=(bash)
makedepends=(git)
source=(git+"https://github.com/BaerLKR/todoscript.git")
md5sums=('SKIP')

pkgver() {
  cd "todoscript"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() { 
  mkdir -p ${pkgdir}/usr/bin/todo
  cp "${srcdir}/todoscript/todoscript.sh" "${pkgdir}/usr/bin/"
  chmod +x "${pkgdir}/usr/bin/todoscript.sh"
}
