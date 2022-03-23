# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=abeceda_convertor-git
_pkgname=abeceda_convertor
pkgver=r10.7157e67
pkgrel=1
pkgdesc="Python script adding auxiliary characters for text typeset in Abeceda_v4.ttf font"
arch=('any')
url="https://github.com/jose1711/abeceda_convertor/"
license=('GPL')
depends=('python')
source=("git+https://github.com/jose1711/abeceda_convertor.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  }

package() {
  cd $srcdir/$_pkgname
  install -Dm755 abeceda.py ${pkgdir}/usr/bin/abeceda.py
  install -Dm644 abeceda_convertor.desktop ${pkgdir}/usr/share/applications/abeceda_convertor.desktop
  install -Dm644 abeceda_convertor.svg ${pkgdir}/usr/share/pixmaps/abeceda_convertor.desktop.svg
}
