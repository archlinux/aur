# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=igv
pkgver=2.4.10
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="High-performance visualization tool for interactive exploration of large, integrated genomic datasets."
arch=('any')
url="http://www.broadinstitute.org/software/igv/home"
license=('LGPL')
depends=('java-environment>=8' 'sh')
source=("http://www.broadinstitute.org/igv/projects/downloads/2.4/IGV_${_pkgver}.zip" \
	"http://www.broadinstitute.org/software/igv/sites/cancerinformatics.org.igv/files/images/tools.png" \
  "$pkgname.sh" "$pkgname.desktop")
sha512sums=('35f8caa32b24f756a457312859afd9fb40cdd419d0a25ab9b6144d7c25a649ef67b0d057f127c918dfdf4752f44e985b5b378fc9f02905995b7d8caa457b582b'
            'e71a0dc70c717b3db00268632500b5723b8cddb1ecfbd8ce48b77ffad59bf93a8d275cc5ebd18b9eb1025200438ac55ec348def343b1b5f72a2c982b5dc4cc90'
            'bfda39fac975ce8112a0060b28e7e5bfd5bb4db9481f091c0da487dd3b974803de000bea3b6d4d6378cee04f7cd45955b648c6fb62779044703fb18ba0eced30'
            '32249be8c636570a9f2a9700cbd8a43613c3837e81df4bd9baa2b6ec9cf70b45bd28c0f597e5fc899a6fad22a66b0e8f8baf01952efae2e84ca986e1232163d0')

package() {    
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 tools.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"  
  cd "$srcdir/IGV_${_pkgver}"
  install -Dm644 $pkgname.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"  
  install -Dm644 batik-codec__V1.7.jar \
    "$pkgdir/usr/share/java/$pkgname/batik-codec__V1.7.jar"  
  install -Dm644 goby-io-igv__V1.0.jar \
    "$pkgdir/usr/share/java/$pkgname/goby-io-igv__V1.0.jar"
}
