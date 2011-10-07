# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2011.09.30
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python2')
source=(https://github.com/rg3/${pkgname}/raw/${pkgver}/${pkgname})
sha1sums=('5a323d29a803d7563a058ac08e9e5a087ce6870b')

package() {
  cd "${srcdir}"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' youtube-dl
  install -D -m755 youtube-dl "${pkgdir}/usr/bin/youtube-dl"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  grep -i license youtube-dl > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
