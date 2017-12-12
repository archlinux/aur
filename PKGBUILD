# Maintainer: Valdis Vitolins <valdis.vitolins@odo.lv>

pkgname=mbrola-bin-armv7l
pkgver=3.0
pkgrel=5
pkgdesc="A phoneme-to-audio converter used by many TTS (Text-to-speech) programs"
arch=('armv7l')
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
license=('custom:Mbrola')
depends_armv7l=('glibc')
source=("http://tcts.fpms.ac.be/synthesis/mbrola/bin/raspberri_pi/mbrola.tgz")
sha256sums=('37c520082e6770de35230a3737dcfb32dd33431ed38927d4e4b22b85416e9733')

build() {
  # Prepare license file
  # sed -n '/This program and object/,/2.0 A brief description of MBROLA/p' readme.txt | head -n -1 > "LICENSE"
}

package() {
  # Install executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "mbrola" "${pkgdir}/usr/bin/${pkgname}"
}

