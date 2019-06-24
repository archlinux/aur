# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Tomáš Mládek <tmladek [on] inventati [bop] org>
# Contributor: Eugene Dvoretsky <radioxoma at g-mail>
# Contributor: m-pilia

pkgname=3dslicer
pkgver=4.10.2
pkgrel=1
pkgdesc="A free, open source software package for image analysis and scientific visualization."
url="http://slicer.org"
arch=('x86_64')
license=('BSD')
depends=('glu')
source=("Slicer-$pkgver-linux-amd64.tar.gz::https://download.slicer.org/bitstream/1023242"
        "3dslicer.png::https://www.slicer.org/slicerWiki/images/7/71/3DSlicerLogo-DesktopIcon-128x128.png"
        "3dslicer.desktop")
sha512sums=('36f1b175f987e7d1e288f08d55c6942e494f1234bfdfb4ffae8517bb1711418c6ae3d5efd3f57dc31a7f65c451c8324d8c09d4de697b6b81d0a85ec48299c686'
            'f3f8a3de8b774d2a968e293471f92d23af5f56a2f025f0ad49035802d94f35a6578c8a161e9f9ed3c2f63beb337bea6952f93e0651ecc6a34c20fd8171e4d087'
            '0a6c00eeb4bac3862c0cac63b20d05068deb2f46540ba5f73bad9f74697d62022b952641562762049fb0473eed9cd816e39388c440fbdef03518609825834194')

package() {
  install -d "$pkgdir"/opt/3dslicer "$pkgdir"/usr/bin
  mv "$srcdir/Slicer-$pkgver-linux-amd64/"* "$pkgdir/opt/3dslicer"
  ln -s /opt/3dslicer/Slicer "$pkgdir/usr/bin"
  install -Dm644 "${srcdir}/3dslicer.desktop" "${pkgdir}/usr/share/applications/3dslicer.desktop"
  # https://www.slicer.org/slicerWiki/index.php/Slicer3:Slicer3Brand
  install -Dm644 "${srcdir}/3dslicer.png" "${pkgdir}/usr/share/pixmaps/3dslicer.png"
}
