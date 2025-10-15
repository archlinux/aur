# Maintainer: Alexander Björk <bjorkalx@protonmail.com>
# Maintainer: johnpyp <johnpyp.dev@gmail.com>

pkgname="redact-bin"
pkgdesc="Customize Redact to remove the content you'd like. Remove old tweets, images, discord messages, and much more."
pkgver="0.19.1"
pkgrel=1
arch=('x86_64')
url="https://redact.dev/"
license=('custom')
provides=('redact')
conflicts=('redact')
source=("https://update-desktop.redact.dev/build/Redact-${pkgver}.zip"
  "redact.desktop")
sha256sums=('3c346888eef64cec41f3554d760ad93f68f5e953c1000197b532a1ccaacdebe6'
            'a05e8dd421979d3342dfaa011129ef3fdf0905b6bcf26646c687a3b63504081b')

package() {
  install -d ${pkgdir}/opt/${pkgname}
  cp -r $srcdir/* ${pkgdir}/opt/${pkgname}/
  install -d ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/redact ${pkgdir}/usr/bin/redact
  install -Dm644 "${srcdir}/redact.desktop" "${pkgdir}/usr/share/applications/redact.desktop"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  ln -s /opt/${pkgname}/resources/assets/icon.png "${pkgdir}/usr/share/pixmaps/redact.png"
}
