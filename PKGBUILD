# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2011.03.29
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom:public domain')
depends=('python2')
source=("https://github.com/rg3/${pkgname}/raw/${pkgver}/${pkgname}")
md5sums=('d481c3e15e306e3e5157e0142758c011')

package() {
  cd "${srcdir}"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' youtube-dl
  install -D -m755 youtube-dl "${pkgdir}/usr/bin/youtube-dl"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  grep License youtube-dl  > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

