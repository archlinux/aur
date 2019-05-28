# Maintainer: François Menning <f.menning@pm.me>
# Contributer: Marcel Korpel <marcel[dot]korpel[at]gmail>

_pkgname=GemistDownloader
pkgver=2.9.0.8a
pkgname=${_pkgname,,}
_pkgver=${pkgver//.}
pkgrel=2
pkgdesc='Download programmes from Dutch broadcasting companies'
arch=('any')
url="http://helpdeskweb.nl/gemistdownloader/mono"
license=('CCPL:by-nc-nd')
depends=('gtk-sharp-2' 'ffmpeg')
source=(http://www.helpdeskweb.nl/mono_${_pkgname}_${_pkgver}.zip
        ${pkgname}.sh
        'gemistdownloader.desktop'
        'gemistdownloader.png')
sha256sums=('7c4050fa8508401a9796f7327fab8ac8b0e78a99e7ed24aa42246fa90211ad93'
            '08fa204eec19b630837409c66bfe087a21bcebffa57f14919f1b88435f70da3a'
            '10c6364695b45a66346c75b36cd664d36df6e4e8e73f05f4f2c79a014a2f16d6'
            '40a249a289bf4425457694f7fe38e5674463d47b7b5a1af9262e097cad924e9c')

package() {
  cd "$srcdir"

  install -Dm644 ${_pkgname}.exe "${pkgdir}/usr/share/${pkgname}/${_pkgname}.exe"
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/gemistdownloader.desktop" "${pkgdir}/usr/share/applications/gemistdownloader.desktop"
  install -Dm644 "${srcdir}/gemistdownloader.png" "${pkgdir}/usr/share/pixmaps/gemistdownloader.png"
}
