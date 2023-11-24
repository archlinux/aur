# Maintainer: mrxx <mrxx at cyberhome dot at>

_debpkg=musique
pkgname=musique-bin
pkgver=1.12
pkgrel=1
pkgdesc="A finely crafted music player"
arch=('x86_64')
url="https://flavio.tordini.org/musique"
license=('custom')
depends=('phonon-qt5' 'taglib' 'mpv')
source=("${_debpkg}-${pkgver}.deb::https://flavio.tordini.org/files/${_debpkg}/${_debpkg}.deb")
sha256sums=('41b40d010f94dc19d93c258c90b04b61f6e3f59cee19fe24fc3fd64247d1c784')

package() {
  tar --zstd -xvf data.tar.zst -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/share/* "${pkgdir}"/usr/share/
  mv "${pkgdir}"/usr/local/bin "${pkgdir}"/usr/
  install -Dm644 "${pkgdir}"/usr/share/doc/${_debpkg}/copyright "${pkgdir}"/usr/share/licenses/${_debpkg}/copyright
}
