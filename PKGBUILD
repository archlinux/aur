# Maintainer: Henry Tung <henryptung at gmail dot com>
# Contributor: luckdragon <f41c0r [/at\] cyb3r DOT space>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>

pkgname=jbidwatcher
pkgver=2.99pre5
pkgrel=2
pkgdesc='Allows you to monitor eBay auctions, submit bids, and snipe.'
arch=('any')
url="http://www.jbidwatcher.com/"
license=('custom:CCPL-by-nc-sa-amended')
depends=('java-runtime>=8' 'desktop-file-utils')
install=jbidwatcher.install
source=(https://www.jbidwatcher.com/download/JBidwatcher-${pkgver}.tar.bz2
        http://www.jbidwatcher.com/images/jay_noback.png
        jbidwatcher jbidwatcher.desktop LICENSE)
sha256sums=('7ec60f0c4e0192e4788e13e5a233844305995cc16d3abc7ff7ed97df7f3e6dd9'
          'b78d62804d1f4fda02abd02733e521ae50adcb4ee3e05540557a9fa4efdbfe3b'
          '13eaa6f2ef9045a8f468ac4f696f3023ca6ad4de6a2e45a6b9b3660e2b9ac18a'
          '825f2d9c6c9f8d45301eb4199ef0d8074e0a6b294c43b899cb55ab2298c4e561'
          '92ef1e9f73843497f2a77d593003ae180028b88c0cc6191ff13c12a9fa686d36')


package() {
  cd "${srcdir}"
  install -D -m755 jbidwatcher "${pkgdir}/usr/bin/jbidwatcher"
  install -d -m755 "${pkgdir}/usr/share/java/jbidwatcher"
  cp -dr --preserve=mode,timestamps JBidwatcher/{app,lib} "${pkgdir}/usr/share/java/jbidwatcher/"
  install -D -m644 jbidwatcher.desktop "${pkgdir}/usr/share/applications/jbidwatcher.desktop"
  install -D -m644 jay_noback.png "${pkgdir}/usr/share/pixmaps/jay_noback.png"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
