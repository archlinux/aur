# Maintainer: mrxx <mrxx at cyberhome dot at>

_debpkg=musique
pkgname=musique-bin
pkgver=1.10.1
pkgrel=2
pkgdesc="A finely crafted music player"
arch=('x86_64')
url="https://flavio.tordini.org/musique"
license=('custom')
depends=('phonon-qt5' 'taglib' 'mpv')
source=("${_debpkg}-${pkgver}.deb::https://flavio.tordini.org/files/${_debpkg}/${_debpkg}.deb")
sha256sums=('2b114eb2b3461c82730b4e33f6292adb8a9b2efb2218ec5b11245838d1c6bd8a')

package() {
  tar -Jxvf data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/share/* "${pkgdir}"/usr/share/
  mv "${pkgdir}"/usr/local/bin "${pkgdir}"/usr/
  install -Dm644 "${pkgdir}"/usr/share/doc/${_debpkg}/copyright "${pkgdir}"/usr/share/licenses/${_debpkg}/copyright
}
