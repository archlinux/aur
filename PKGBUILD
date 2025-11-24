# Maintainer: Sergio Schneider <s p s f 6 4 @ m s n . com>
# Original author: Anton Karmanov <a.karmanov@inventati.org>

pkgname=sound-theme-simple
pkgver=1.0
pkgrel=1
pkgdesc='Complete system sound theme with 70+ event sounds. Tested with Gnome (check docs on how to enable) and XFCE. Adapted from Smooth sound theme'
arch=('any')
#Original url='https://www.pling.com/p/1187979/'
url='https://github.com/spsf64/simple'
license=('custom:combined')

# _src_url='https://my.opendesktop.org/s/QrcjmXiTpqQsciE/download/Smooth_v1.2.tar.gz'
# source=("${pkgname}-${pkgver}.tar.gz::${_src_url}")
source=("https://github.com/spsf64/simple/releases/download/1/simple-1.0.tar.gz")
b2sums=('6fb0e00b2292e0ac400323655df3a7b8d8a2f63412d58b620f26285296a933411c0c32144f0b53568faad48121623bf1a11b3aec39dd3744f98ffa56d3faa0f8')

package() {
  install -dm755 "${pkgdir}/usr/share/sounds/simple"
  install -dm755 "${pkgdir}/usr/share/sounds/simple/stereo"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}/simple/documentation/"
  docs=('how to enable gnome sound events.txt')
  install -Dm644 "${docs[@]}" "${pkgdir}/usr/share/doc/${pkgname}"

  cd "${srcdir}/simple/documentation/OriginalDocs"
  docs=('how to install on xfce.txt' 'NO WARRANTY' 'Product Description')
  install -Dm644 "${docs[@]}" "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 \
    'Smooth sound theme sounds license agreements and Authors.pdf' \
    "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd ${srcdir}
  install -Dm644 simple/index.theme "${pkgdir}/usr/share/sounds/simple"
  install -Dm644 simple/stereo/* "${pkgdir}/usr/share/sounds/simple/stereo"
}
