# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pip2arch-git
pkgrel=3
pkgver=r65.f2a2aff
pkgdesc='Tool to convert entries in the pypi database to PKGBUILDs'
arch=('any')
url="https://github.com/lclarkmichalek/pip2arch"
license=('GPL2')
depends=('python')
makedepends=('git')
md5sums=('SKIP')

source=("${pkgname}"::'git+https://github.com/lclarkmichalek/pip2arch.git')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
  install -Dm755 ${srcdir}/${pkgname}/pip2arch.py ${pkgdir}/usr/bin/pip2arch.py
  install -Dm644 ${srcdir}/${pkgname}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README
}
