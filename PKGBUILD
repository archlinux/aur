# Maintainer: mrxx <mrxx at cyberhome dot at>

_debpkg=musique
pkgname=musique-bin
pkgver=1.7
pkgrel=1
pkgdesc="A finely crafted music player"
arch=('x86_64')
url="https://flavio.tordini.org/musique"
license=('custom')
depends=('phonon-qt5' 'taglib' 'mpv')
source=("${_debpkg}-${pkgver}.deb::http://flavio.tordini.org/files/${_debpkg}/${_debpkg}.deb")
sha256sums=('99b6b6d54910a7bf73460e7427e5df00b46bffb62084bd9c6c8e3738561af368')

package() {
  tar -Jxvf data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/share/* "${pkgdir}"/usr/share/
  mv "${pkgdir}"/usr/local/bin "${pkgdir}"/usr/
  install -Dm644 "${pkgdir}"/usr/share/doc/${_debpkg}/copyright "${pkgdir}"/usr/share/licenses/${_debpkg}/copyright
}
