# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=eternally-us
pkgver=1
pkgrel=4
pkgdesc="A tale of love, life and friendship."
arch=(i686 x86_64)
url="http://www.adventuregamestudio.co.uk/site/games/game/1303/"
license=('custom')
install='eternallyus.install'
depends=(wine wine_gecko wine-mono)
makedepends=(unzip)
source=(eternally-us eternally-us.zip::https://www.agsarchives.com/download-file/GameID/1123/eternally-us.html)
md5sums=('49d04117fe34493f449beaacc3dad45f'
         '1e6aeda04589209252432d9a62358c9c')
package() {
  cd "${srcdir}"

  rm -f winsetup.exe #We don't need the setup file
  rm -f Readme.txt
  
  install -d -m755  "${pkgdir}/usr/share/eternally-us"
  cp -ra "${srcdir}"/* "${pkgdir}/usr/share/eternally-us"
  find "${pkgdir}/usr/share/eternally-us" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/eternally-us" -type f -exec chmod 644 "{}" \;


  # Remove spaces in the exe file
  mv "${pkgdir}/usr/share/eternally-us/Eternally Us.exe" "${pkgdir}/usr/share/eternally-us/EternallyUs.exe"
  
  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 eternally-us "${pkgdir}/usr/bin"
   
  }
