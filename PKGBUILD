# Maintainer: Tete Plaza <11tete11@gmail.com>

pkgname=dropbox-plasma-light-icons-git
_pkgname=dropbox-plasma-light-icons
pkgver=20161008
pkgrel=1
pkgdesc="Dropbox icons for Plasma 5 Light Panels"
arch=('any')
url="https://github.com/x11tete11x/dropbox-plasma-light-icons"
license=('GPL')
depends=('hicolor-icon-theme' 'dropbox')
conflicts=('dropbox-kfilebox-icons'
           'dropbox-plasma-dark-icons-git')           
source=(git://github.com/x11tete11x/dropbox-plasma-light-icons.git)
md5sums=(SKIP)
install="dropbox-plasma-light-icons.install"

pkgver(){
    cd ${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package(){
  install -d "${pkgdir}/usr/share/icons/hicolor/"
  cp -r ${srcdir}/${_pkgname}/icons/* "${pkgdir}/usr/share/icons/hicolor/"
}
