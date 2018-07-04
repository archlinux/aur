# Contributor: Decrypted Epsilon <decrypted.epsilon@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer:  Piotr Balwierz <parseByHuman(surname at email_service_of_google)>

pkgname=igv
pkgver=2.4.11
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="High-performance visualization tool for interactive exploration of large, integrated genomic datasets."
arch=('any')
url="http://www.broadinstitute.org/software/igv/home"
license=('LGPL')
depends=('java-environment=8' 'archlinux-java-run' 'sh')
#"igv-$pkgver.tar.gz::https://github.com/igvteam/igv/archive/v$pkgver.tar.gz"
source=("http://data.broadinstitute.org/igv/projects/downloads/2.4/IGV_$pkgver.zip"
	"http://www.broadinstitute.org/software/igv/sites/cancerinformatics.org.igv/files/images/tools.png"
	"$pkgname.sh"
	"$pkgname.desktop")
sha512sums=('d3f7c0e3a4b090fe3ae1d21375be0285c026dcf284fdefdaa02bd0247bd27515e9c2dc14798ebad2f0273bd70bbdad2aaff3dc91ecfd9cc74993246ae0b10a98'
            'e71a0dc70c717b3db00268632500b5723b8cddb1ecfbd8ce48b77ffad59bf93a8d275cc5ebd18b9eb1025200438ac55ec348def343b1b5f72a2c982b5dc4cc90'
            '1f0cdbb8467de2a4b287da3fc366f8b5b967f744dab28ffb613a88257caa326b7a1332c8b656ec8fd69ef00114a8d658db6a73fde89b55e7918be094cc6f56ff'
            '5ba8666c9c0568f11baf79242c4853964a4061269c0b84529b71a02a106e142bc559ccb97a6a51801dbccacf5f2061cead315b5ece60fc4564c3c38b02d733e7')

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
