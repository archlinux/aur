# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Max Nemeth <max.nemeth@gmail.com>
# Contributor: Bob Finch <bfinch@qrparci.net>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=jbidwatcher
pkgver=2.5.6
pkgrel=2
pkgdesc='Allows you to monitor eBay auctions, submit bids, and snipe.'
arch=('any')
url="http://www.jbidwatcher.com/"
license=('LGPL')
depends=('java-runtime' 'desktop-file-utils')
noextract=("JBidwatcher-${pkgver}.jar")
install=jbidwatcher.install
source=(http://www.jbidwatcher.com/download/JBidwatcher-${pkgver}.jar
        http://www.jbidwatcher.com/images/jay_noback.png
        jbidwatcher jbidwatcher.desktop)
sha1sums=('cd4233fd48fdb75267935d9114c7bf80666efc45'
          '255b09030ebfd9cd7a080164bc10b901e36204b0'
          '50e60c78344f8638977c0524fd72a93b30a1d1ab'
          '8c66182fe39a4a766f62c6f82130358ed21aa79e')

package() {
  cd "${srcdir}"
  install -D -m755 jbidwatcher "${pkgdir}/usr/bin/jbidwatcher"
  install -D -m644 JBidwatcher-${pkgver}.jar "${pkgdir}/usr/share/java/jbidwatcher/JBidwatcher.jar"
  install -D -m644 jbidwatcher.desktop "${pkgdir}/usr/share/applications/jbidwatcher.desktop"
  install -D -m644 jay_noback.png "${pkgdir}/usr/share/pixmaps/jay_noback.png"
}
