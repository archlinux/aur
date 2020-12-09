# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# otfinfo --info *.otf

_pkgname='rally-symbols'
pkgname="otf-${_pkgname}"
pkgver=1.001
pkgrel=1
pkgdesc='Automotive rally symbols font'
arch=('any')
url='https://www.dafont.com/rally-symbols.font'
license=('custom')
source=("${pkgname}-${pkgver}-${pkgrel}.zip::https://dl.dafont.com/dl/?f=${_pkgname/-/_}"
        "${pkgname}-${pkgver}-${pkgrel}-README.png::https://www.dafont.com/img/charmap/${_pkgname::1}/${_pkgname:1:1}/${_pkgname/-/_}0.png")
sha256sums=('e78fcca993f27119a30261e918f3ae2e048acddca76b7e89d6e65cba910dc06d'
            'e7965f9fd44fbbd667c461dc1a5cf0a463e0cce9eee1a10dba6b1b277e2a400b')

prepare() {
  echo 'Copyright (c) 2007 by Lukyan Turetsky. All rights reserved. Rally Control Signs' > 'LICENSE'
}

package() {
  install -Dvm644 ./*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dvm644 "${pkgname}-${pkgver}-${pkgrel}-README.png"  "${pkgdir}/usr/share/doc/${pkgname}/README.png"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim ts=2 sw=2 et:
