# Maintainer: mrxx <mrxx at cyberhome dot at>

_debpkg=musique
pkgname=musique-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="A finely crafted music player"
arch=('x86_64')
url="https://flavio.tordini.org/musique"
license=('custom')
depends=('phonon-qt5' 'taglib' 'mpv')
source=("${_debpkg}-${pkgver}.deb::http://flavio.tordini.org/files/${_debpkg}/${_debpkg}.deb")
sha256sums=('d763e23dff01485d0b3d0faa6c846cddc81d3f83ea720e83a8a3a7df1346ce35')

package() {
  tar -Jxvf data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/share/* "${pkgdir}"/usr/share/
  mv "${pkgdir}"/usr/local/bin "${pkgdir}"/usr/
  install -Dm644 "${pkgdir}"/usr/share/doc/${_debpkg}/copyright "${pkgdir}"/usr/share/licenses/${_debpkg}/copyright
}
