# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=microemulator
pkgver=2.0.4
pkgrel=3
arch=('any')
pkgdesc="This is Java 2 Micro Edition (J2ME) CLDC/MIDP Emulator."
url="https://sourceforge.net/projects/microemulator/"
license=('GPL')
depends=('java-runtime')
source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.zip
        microemulator.launcher microemulator.desktop config2.xml)

md5sums=('d4a859a9aae5d90e25f11146abf1e27a'
         'c166cc61d77d21866f619f37db7e1d24'
         '9dd770f276906360aa7a39fbbfff7d02'
         'c3f1035fa2fb2448e684dd8f4e689377')
sha512sums=('f67463d41b8dfce16bde8ee0e4155f6827d57430b183bb11dafa82aa017c349fe13f94b57414592458c2cca34ab3c805c1be8f45d34e1f13ea10d4200ac046b6'
            '8dbb95e178626ee6317de44698ba976d2d2de5084c8cb59a9d358fd49d446982228fdaf8bcfb6de8fe8becf3ae0becf712a999345f45a169bc24aa76ca937388'
            '35207eaf12158b1e90a157cdcf22538344da7de57e26cfd520be6d6776cf58250a87e3098ad3444116bd976fe26062cd7b6cfedac33da398aa6387ab9fefeb7c'
            '29053c1111a0dd147ef5d55bd70a0675ecdd6f5d54951b6ddf5ef35e9ddebf38acf47506a245907c6f7820987d496e1aeadd3d47b7be101ed70a5dc4ece23eed')

build() {
  cd $srcdir/$pkgname-$pkgver
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d -m0755 "$pkgdir"/usr/share/java/$pkgname/
  cp -R $pkgname.jar devices lib "$pkgdir"/usr/share/java/$pkgname/
  cp $srcdir/config2.xml "$pkgdir"/usr/share/java/$pkgname
  install -Dm755 ../$pkgname.launcher "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}
