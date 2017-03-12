# Maintainer: Alif Rachmawadi <code@subosito.com>

pkgname=dropbox-light-icons-git
_pkgname=dropbox-light-icons
pkgver=20170312
pkgrel=1
pkgdesc="Dropbox light icons for dark panels"
arch=('any')
url="https://github.com/subosito/dropbox-light-icons"
license=('GPL')
depends=('hicolor-icon-theme' 'dropbox')
makedepends=('git')
conflicts=('dropbox-kfilebox-icons'
           'dropbox-plasma-light-icons-git'
           'dropbox-plasma-dark-icons-git')
source=(git://github.com/subosito/dropbox-light-icons.git)
md5sums=(SKIP)
install="dropbox-light-icons.install"

pkgver(){
    cd ${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package(){
  install -d "${pkgdir}/usr/share/icons/hicolor/"
  cp -r ${srcdir}/${_pkgname}/icons/* "${pkgdir}/usr/share/icons/hicolor/"
}
