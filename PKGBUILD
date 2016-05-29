# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=isoviewer
pkgver=1.11
pkgrel=2
epoch=1
arch=('any')
pkgdesc="GUI application to have a closer look at ISO 14496-12 and other MP4 files"
url="https://github.com/sannies/$pkgname"
license=('Apache')
depends=('java-environment' 'desktop-file-utils')
source=("$pkgname-$pkgver.jar::https://github.com/sannies/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver-SNAPSHOT.jar"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('897cb8bc7229ccb7691d88d5bca541448fffb903b3c7d275b2712c174af7736e'
            '3eb71c73fad7cf45b54456ab4620e8114a894f27b3ee8a37592d0df60ae8fa93'
            '7cb05a62aea4a4e1b9f6378682535438f5e6de342961fbdaade27ae2c67777ca')

package() {
  cd $srcdir
  # start script
  install -m755 -D "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # jar file
  install -m644 -D "./$pkgname-$pkgver.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  # menu entry
  install -m644 -D "./${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
