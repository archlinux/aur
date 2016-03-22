# Maintainer: luckdragon <f41c0r [/at\] cyb3r DOT space>
# Original maintainer from the AUR3 package: yugrotavele <yugrotavele at archlinux dot us>

pkgname=jbidwatcher
pkgver=2.99pre5
pkgrel=1
pkgdesc='Allows you to monitor eBay auctions, submit bids, and snipe.'
arch=('any')
url="http://www.jbidwatcher.com/"
license=('custom:CCPL-by-nc-sa-amended')
depends=('java-runtime' 'desktop-file-utils')
noextract=("JBidwatcher-${pkgver}.jar")
install=jbidwatcher.install
source=(https://www.jbidwatcher.com/download/JBidwatcher-${pkgver}.jar
        http://www.jbidwatcher.com/images/jay_noback.png
        jbidwatcher jbidwatcher.desktop LICENSE)
sha256sums=('9c1c3f9bb4ad1ac0655eccc440d89d584c7cd6639cca7d905a9faae04467c95c'
          'b78d62804d1f4fda02abd02733e521ae50adcb4ee3e05540557a9fa4efdbfe3b'
          '9e5a26e57312e30752b75845f1c910bb4f1934412d0bc4600faa014153b9b714'
          '825f2d9c6c9f8d45301eb4199ef0d8074e0a6b294c43b899cb55ab2298c4e561'
          '92ef1e9f73843497f2a77d593003ae180028b88c0cc6191ff13c12a9fa686d36')


package() {
  cd "${srcdir}"
  install -D -m755 jbidwatcher "${pkgdir}/usr/bin/jbidwatcher"
  install -D -m644 JBidwatcher-${pkgver}.jar "${pkgdir}/usr/share/java/jbidwatcher/JBidwatcher.jar"
  install -D -m644 jbidwatcher.desktop "${pkgdir}/usr/share/applications/jbidwatcher.desktop"
  install -D -m644 jay_noback.png "${pkgdir}/usr/share/pixmaps/jay_noback.png"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
