# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=igv
pkgver=2.4.11
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="High-performance visualization tool for interactive exploration of large, integrated genomic datasets."
arch=('any')
url="http://www.broadinstitute.org/software/igv/home"
license=('LGPL')
depends=('java-environment>=8' 'sh')
source=("igv-$pkgver.tar.gz::https://github.com/igvteam/igv/archive/v$pkgver.tar.gz" \
	"http://www.broadinstitute.org/software/igv/sites/cancerinformatics.org.igv/files/images/tools.png" \
  "$pkgname.sh" "$pkgname.desktop")
sha512sums=('a93a2b6abddad23910bef3d21d59404b166ea9699a7b8b7f67b590ff5908da9368c4101d8102c14fe5ac1c704ea76922523fcb73ea4120e597e0ce66529466cf'
            'e71a0dc70c717b3db00268632500b5723b8cddb1ecfbd8ce48b77ffad59bf93a8d275cc5ebd18b9eb1025200438ac55ec348def343b1b5f72a2c982b5dc4cc90'
            'bfda39fac975ce8112a0060b28e7e5bfd5bb4db9481f091c0da487dd3b974803de000bea3b6d4d6378cee04f7cd45955b648c6fb62779044703fb18ba0eced30'
            '32249be8c636570a9f2a9700cbd8a43613c3837e81df4bd9baa2b6ec9cf70b45bd28c0f597e5fc899a6fad22a66b0e8f8baf01952efae2e84ca986e1232163d0')

package() {    
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 tools.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  cd IGV_${_pkgver}
  install -Dm644 $pkgname.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
  install -Dm644 batik-codec__V1.7.jar \
    "$pkgdir"/usr/share/java/$pkgname/batik-codec__V1.7.jar
  install -Dm644 goby-io-igv__V1.0.jar \
    "$pkgdir"/usr/share/java/$pkgname/goby-io-igv__V1.0.jar
}
