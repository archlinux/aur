# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>

_truepkgname=GemistDownloader
pkgver=2.8.1.15_beta
pkgname=${_truepkgname,,}
_pkgver=${pkgver//.}
pkgrel=1
pkgdesc='Download programmes from Dutch broadcasting companies'
arch=('any')
url="http://helpdeskweb.nl/gemistdownloader/mono"
license=('CCPL:by-nc-nd')
depends=('mono' 'ffmpeg' 'sh')
source=(http://www.helpdeskweb.nl/mono_${_truepkgname}_${_pkgver}.zip
        ${pkgname}.sh)
sha256sums=('32741b6e7a30af50b2c2289a96ffa6d2a7b29b41da3e1ce8c7f7f90a6e5606a1'
            '08fa204eec19b630837409c66bfe087a21bcebffa57f14919f1b88435f70da3a')

package() {
  cd "$srcdir"

  install -Dm644 ${_truepkgname}.exe "${pkgdir}/usr/share/${pkgname}/${_truepkgname}.exe"
  install -D ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
