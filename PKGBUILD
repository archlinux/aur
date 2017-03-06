# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>

_truepkgname=GemistDownloader
pkgver=2.9.0.4
pkgname=${_truepkgname,,}
_pkgver=${pkgver//.}
pkgrel=1
pkgdesc='Download programmes from Dutch broadcasting companies'
arch=('any')
url="http://helpdeskweb.nl/gemistdownloader/mono"
license=('CCPL:by-nc-nd')
depends=('gtk-sharp-2' 'ffmpeg' 'sh')
source=(http://www.helpdeskweb.nl/mono_${_truepkgname}_${_pkgver}.zip
        ${pkgname}.sh)
sha256sums=('1492698308627e634754032715cb3c1cc4107f282e4a3fb394f275d0fe73c5ba'
            '08fa204eec19b630837409c66bfe087a21bcebffa57f14919f1b88435f70da3a')

package() {
  cd "$srcdir"

  install -Dm644 ${_truepkgname}.exe "${pkgdir}/usr/share/${pkgname}/${_truepkgname}.exe"
  install -D ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
