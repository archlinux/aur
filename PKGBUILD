# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=sound-theme-smooth
pkgver=1.2
pkgrel=2
pkgdesc='Complete system sound theme with 58 event sounds'
arch=('any')
url='https://www.pling.com/p/1187979/'
license=('custom:combined')
_src_url='https://my.opendesktop.org/s/QrcjmXiTpqQsciE/download/Smooth_v1.2.tar.gz'
source=("${pkgname}-${pkgver}.tar.gz::${_src_url}")
md5sums=('604fad389740b481d16a40d74c3b49fd')

package() {
  install -dm755 "${pkgdir}/usr/share/sounds/Smooth"
  install -dm755 "${pkgdir}/usr/share/sounds/Smooth/stereo"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"


  cd "${srcdir}/Smooth/documentation/"
  docs=('how to install on xfce.txt' 'NO WARRANTY' 'Product Description')
  install -Dm644 "${docs[@]}" "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 \
    'Smooth sound theme sounds license agreements and Authors.pdf' \
    "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd ${srcdir}
  install -Dm644 Smooth/index.theme "${pkgdir}/usr/share/sounds/Smooth"
  install -Dm644 Smooth/stereo/* "${pkgdir}/usr/share/sounds/Smooth/stereo"
}
