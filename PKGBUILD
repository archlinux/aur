pkgname=linvst
pkgver=1.8
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("https://github.com/osxmidi/LinVst/releases/download/1.8/LinVst-${pkgver}-Debian-Stretch.zip")
sha256sums=('96e72788f11f351d3dabb9c870e658aad215332d4a3065418d72bcb41a266f53')

package() {
  for file in "${srcdir}/LinVst-${pkgver}-Debian-Stretch/embedded-version/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
