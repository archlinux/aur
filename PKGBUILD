# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=eternally-us
pkgver=1
pkgrel=3
pkgdesc="A tale of love, life and friendship."
arch=(i686 x86_64)
url="http://www.undergrowthgames.com/index.php?show=games&gameid=3"
license=('custom')
install='eternallyus.install'
depends=(wine)
makedepends=(unrar)
_sourcefile=Eternally%20Us.rar
noextract=(${_sourcefile})
source=(eternally-us http://www.undergrowthgames.com/${_sourcefile})
md5sums=('3231439e67f11a7477f0fd839563e20d'
         'b3c475a57900081bc07bca4c12bbdad6')
package() {
  cd "${srcdir}"
  
  unrar x -o+ -inul ${_sourcefile}
  
  rm -f ${sourcefile}
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
