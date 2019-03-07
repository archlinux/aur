# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

# Thanks and credits to Chris (crmullins) for the stable version of this PKGBUILD, which formed the basis of this version

pkgname=3dslicer-nightly
pkgver=4.11.0_2019_03_06
pkgrel=1
pkgdesc="A free, open source software package for image analysis and scientific visualization."
url="http://slicer.org"
arch=('x86_64')
license=('BSD')
depends=('glu')
conflicts=('3dslicer')
provides=('3dslicer')
source=("Slicer-${pkgver//_/-}-linux-amd64.tar.gz::https://download.slicer.org/bitstream/977443"
        "3dslicer.png::https://www.slicer.org/slicerWiki/images/7/71/3DSlicerLogo-DesktopIcon-128x128.png"
        "3dslicer.desktop")
sha512sums=('3e95df35b4c86971b2633cd01f02a147788298b9243452a479969795993dff529b9b99d9f986697432412d3e2133b98d0b9566b904619a605fe8b553efa0978f'
            'f3f8a3de8b774d2a968e293471f92d23af5f56a2f025f0ad49035802d94f35a6578c8a161e9f9ed3c2f63beb337bea6952f93e0651ecc6a34c20fd8171e4d087'
            '0a6c00eeb4bac3862c0cac63b20d05068deb2f46540ba5f73bad9f74697d62022b952641562762049fb0473eed9cd816e39388c440fbdef03518609825834194')

package() {
  install -d "$pkgdir"/opt/3dslicer "$pkgdir"/usr/bin
  mv "$srcdir/Slicer-${pkgver//_/-}-linux-amd64/"* "$pkgdir/opt/3dslicer"
  ln -s /opt/3dslicer/Slicer "$pkgdir/usr/bin"
  install -Dm644 "${srcdir}/3dslicer.desktop" "${pkgdir}/usr/share/applications/3dslicer.desktop"
  # https://www.slicer.org/slicerWiki/index.php/Slicer3:Slicer3Brand
  install -Dm644 "${srcdir}/3dslicer.png" "${pkgdir}/usr/share/pixmaps/3dslicer.png"
}
