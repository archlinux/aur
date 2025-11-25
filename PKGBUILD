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
source=("https://github.com/spsf64/simple/releases/download/1/simple-1.0.tar.gz"
	'.nvchecker.toml')

b2sums=('7e48a2a13cc5d42db7f30dfeb789803bda1847178e5ff7bbcac0e95a88c2cf167411caa37b02d4e79cc21275d271f12af0b5dc4898616c2810b7efcafe94a4ae'
        'c5b42dda10f7912553fc29a6d09833b8017b957402bfdc7a439d22b4b8c28999b35e38cb46a9ea96433b4f15fc8326866d74c3a32cac38d45db081114cf5b1c2')

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
