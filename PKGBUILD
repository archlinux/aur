# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=diary
pkgver=0.2
pkgrel=0
pkgdesc="Simple CLI diary"
arch=("x86_64" "i686")
url="https://github.com/in0rdr/diary"
depends=('ncurses')
license=('MIT')
source=("https://github.com/in0rdr/diary/archive/v${pkgver//_/-}.tar.gz")
md5sums=('8bdd25933e48e87b5b53860de4431e5a')

build(){
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 ${pkgname} "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
