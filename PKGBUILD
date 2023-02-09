# Maintainer: Guoyi
pkgname=smartdenovo
pkgver=2021.02.24
pkgrel=1
pkgdesc="About Ultra-fast de novo assembler using long noisy reads"
arch=('x86_64')
url="https://github.com/ruanjue/smartdenovo"
license=('GPL')
depends=()
makedepends=('git' 'make')
optdepends=()
source=(git+https://github.com/ruanjue/smartdenovo.git)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname}"
    printf $(TZ=UTC git log --no-walk --pretty="%cd" --decorate=full --date=format-local:%Y.%m.%d | head -n 1)
}
build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  
  install -Dm 755 pairaln $pkgdir/usr/bin/pairaln
  install -Dm 755 wtclp $pkgdir/usr/bin/wtclp
  install -Dm 755 wtcns $pkgdir/usr/bin/wtcns
  install -Dm 755 wtcyc $pkgdir/usr/bin/wtcyc
  install -Dm 755 wtext $pkgdir/usr/bin/wtext
  install -Dm 755 wtgbo $pkgdir/usr/bin/wtgbo
  install -Dm 755 wtlay $pkgdir/usr/bin/wtlay
  install -Dm 755 wtmer $pkgdir/usr/bin/wtmer
  install -Dm 755 wtmsa $pkgdir/usr/bin/wtmsa
  install -Dm 755 wtobt $pkgdir/usr/bin/wtobt
  install -Dm 755 wtpre $pkgdir/usr/bin/wtpre
  install -Dm 755 wtzmo $pkgdir/usr/bin/wtzmo

}
