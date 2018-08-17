# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=eternally-us
pkgver=1
pkgrel=5
pkgdesc="A tale of love, life and friendship."
arch=(i686 x86_64)
url="https://archive.org/details/eternally-us"
license=('custom')
install='eternallyus.install'
depends=(wine wine_gecko wine-mono winetricks)
makedepends=(unzip)
source=(eternally-us eternally-us.zip::https://archive.org/download/eternally-us/Eternally%20Us.zip)
md5sums=('3db53074b0689ca1ed4b35ee70c8c81b'
         '1d70b25305d908a2259e098f4a6ca632')
package() {
  cd "${srcdir}"

  rm -f winsetup.exe #We don't need the setup file
  rm -f Readme.txt

  install -d -m755  "${pkgdir}/usr/share/eternally-us"

  mv "Eternally Us.exe" "EternallyUs.exe"
  cp -ra "${srcdir}"/{acsetup.cfg,audio.vox,speech.vox,EternallyUs.exe} "${pkgdir}/usr/share/eternally-us"
  find "${pkgdir}/usr/share/eternally-us" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/eternally-us" -type f -exec chmod 644 "{}" \;

  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 eternally-us "${pkgdir}/usr/bin"
}
