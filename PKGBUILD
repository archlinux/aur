# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=abeceda_convertor-git
_pkgname=abeceda_convertor
pkgver=r10.7157e67
pkgrel=2
pkgdesc="Python script adding auxiliary characters for text typeset in Abeceda_v4.ttf font"
arch=('any')
url="https://github.com/jose1711/abeceda_convertor"
license=('GPL-1.0-or-later')
depends=('python' 'tk' 'hicolor-icon-theme')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/jose1711/abeceda_convertor.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 abeceda.py "${pkgdir}/usr/bin/abeceda.py"
  install -Dm644 abeceda_convertor.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 abeceda_convertor.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
