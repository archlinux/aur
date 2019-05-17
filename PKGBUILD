# Maintainer: mrxx <mrxx at cyberhome dot at>

_debpkg=musique
pkgname=musique-bin
pkgver=1.6
pkgrel=2
pkgdesc="A finely crafted music player"
arch=('x86_64')
url="https://flavio.tordini.org/musique"
license=('custom')
depends=('phonon-qt5' 'taglib' 'mpv')
source=("${_debpkg}-${pkgver}.deb::http://flavio.tordini.org/files/${_debpkg}/${_debpkg}.deb")
sha256sums=('5d659a19723ad1c4bc1f9d5d311175d2746d819b6c160c2493549436e124c323')

package() {
  tar -Jxvf data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/share/* "${pkgdir}"/usr/share/
  mv "${pkgdir}"/usr/local/bin "${pkgdir}"/usr/
  install -Dm644 "${pkgdir}"/usr/share/doc/${_debpkg}/copyright "${pkgdir}"/usr/share/licenses/${_debpkg}/copyright
}
