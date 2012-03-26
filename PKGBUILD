# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2012.02.27
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python2')
source=(${pkgname}-${pkgver}::https://github.com/rg3/${pkgname}/raw/${pkgver}/${pkgname})
sha1sums=('5f9eb89d95670c8f7527cc9e84c8cb0a27075263')

package() {
  cd "${srcdir}"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' youtube-dl-${pkgver}
  install -D -m755 youtube-dl-${pkgver} "${pkgdir}/usr/bin/youtube-dl"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  grep -i license youtube-dl-${pkgver} > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
