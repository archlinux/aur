# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=otf-recursive
pkgver=1.022
pkgrel=1
_betaver=020
_fontdir=Recursive
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::${url}/releases/download/v${pkgver}/recursive-static_fonts-b${_betaver}.zip"
"LICENSE::https://raw.githubusercontent.com/arrowtype/recursive/master/OFL.txt")
sha1sums=('c2b2956a4fcd556bad255fe2af3913dcc2ba7253'
          'f200de5d9656482b8d193adda52514b6402a3cfa')

package() {
  install -D -m644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d ${pkgdir}/usr/share/fonts/OTF/${_fontdir}
  cd ${srcdir}/recursive-static-b1_${_betaver}
  install -Dm644 recursive_mono-static_otf/*.otf ${pkgdir}/usr/share/fonts/OTF/${_fontdir}
  install -Dm644 recursive_sans-static_otf/*.otf ${pkgdir}/usr/share/fonts/OTF/${_fontdir}
}
