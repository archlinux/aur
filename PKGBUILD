# Maintainer:     Jaja <jaja@mailbox.org>
#

pkgname=strans
pkgver=0.0.5
pkgrel=1
pkgdesc="intuitive string manipulation utility for the shell"
arch=('x86_64')
url="https://github.com/Inventitech/strans"
license=('GPL3')
depends=('zlib')
optdepends=('hicolor-icon-theme: icon')
source=(
  "${pkgname}"-"${pkgver}".AppImage::"https://github.com/Inventitech/strans/releases/download/v""${pkgver}""/strans-linux.AppImage"
  strans-icon.png::"https://github.com/Inventitech/strans/raw/master/strans-icon.png"
  "supplementary.tar.xz"
  )
md5sums=('02082e49cbcb72c1009046cccd091648'
         'f1cd390abcbe2585addb8105b22f7839'
         '49226e40f62ca8f61011190f06b448d7')
options=(!strip)

package() {
  ## file and directory permissions for mv and cp: u=rwx,g=rx,o=rx
  umask 022
  ## programm files
  install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}".AppImage "${pkgdir}"/usr/bin/"${pkgname}"
    ## documentation
  install -d "${pkgdir}"/usr/share/man
  mv "${srcdir}"/manpages/* "${pkgdir}"/usr/share/man
  ## .icon and .desktop files
  install -Dm644 "${srcdir}"/strans-icon.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/"${pkgname}".png
}
