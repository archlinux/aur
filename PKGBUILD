# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=diary
pkgver=0.3
pkgrel=0
pkgdesc="Simple CLI diary"
arch=("x86_64" "i686")
url="https://github.com/in0rdr/diary"
depends=('ncurses')
license=('MIT')
source=("https://github.com/in0rdr/diary/archive/v${pkgver//_/-}.tar.gz")
md5sums=('c947c45ca0d00a0ef90f662fe16149cd')

build(){
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 ${pkgname} "${pkgdir}/usr/bin"
  install -Dm644 diary.1 "${pkgdir}/usr/share/man/man1/diary.1"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
