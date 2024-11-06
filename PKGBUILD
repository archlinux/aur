# Maintainer: snit <snit@cock.li>
# Original PKGBUILD Author: Michel Blanc <mb@mbnet.fr>

pkgname=clac
pkgver=0.3.4
pkgrel=1
pkgdesc='A command line, stack-based calculator with postfix notation'
url='https://github.com/soveran/clac'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/soveran/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("0418270992ac0054ea7fe2862b6ba894737a222467ec0d17f6eba04aeac26a4243e3b521d5080521331308f8969ab5b1d8c9ff616902cc098dbef5e2d39f14a2")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  manprefix="${pkgdir}/usr/share/man"
  mkdir -p "${manprefix}/man1"

  echo Created ${manprefix}/man1

  make MANPREFIX="${manprefix}" PREFIX="${pkgdir}/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
