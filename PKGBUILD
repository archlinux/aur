# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=fluentreader
pkgver=1.0.1
pkgrel=1
pkgdesc="Modern desktop RSS reader built with Electron, React, and Fluent UI"
arch=('any')
url="https://github.com/yang991178/fluent-reader/"
license=('BSD-3-Clause License')
source=("https://github.com/yang991178/fluent-reader/releases/download/v${pkgver}/Fluent.Reader.${pkgver}.AppImage" "fluentreader.desktop")
sha256sums=('36c650b05776a33fc043bfbf0a9133cab74f8a936b0666cae2c5d386eca7bfa9'
            '54af9482e7627a9af3495afc909112af61d068d39f7202ae3c270f547d456785')
prepare() {
  cd "${srcdir}"
  chmod +x Fluent.Reader.${pkgver}.AppImage
  ./Fluent.Reader.${pkgver}.AppImage --appimage-extract
}

package() {
   install -dm755 "$pkgdir"/usr/share/{fluentreader,icons,applications}
  mv "$srcdir"/squashfs-root/* "$pkgdir"/usr/share/fluentreader
  install -Dm 755 ${srcdir}/fluentreader.desktop ${pkgdir}/usr/share/applications/fluentreader.desktop
}
