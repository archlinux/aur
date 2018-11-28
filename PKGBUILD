# Maintainer: mrxx <mrxx at cyberhome dot at>

_debpkg=musique
pkgname=musique-bin
pkgver=1.5
pkgrel=1
pkgdesc="A finely crafted music player"
arch=('x86_64')
url="https://flavio.tordini.org/musique"
license=('custom')
depends=('phonon-qt5' 'taglib' 'hicolor-icon-theme')
source=("${_debpkg}-${pkgver}.deb::http://flavio.tordini.org/files/${_debpkg}/${_debpkg}.deb")
sha256sums=('b964f90acb765b853417316dbe391eef4942781eed89fb59629d61fc6cbd9a94')

package() {
  tar -Jxvf data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/share/* "${pkgdir}"/usr/share/
  mv "${pkgdir}"/usr/local/bin "${pkgdir}"/usr/
  install -Dm644 "${pkgdir}"/usr/share/doc/${_debpkg}/copyright "${pkgdir}"/usr/share/licenses/${_debpkg}/copyright
}
