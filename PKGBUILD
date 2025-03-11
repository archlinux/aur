pkgname=rarsm
pkgver=1.7
pkgrel=2
pkgdesc="RARSM - Improved RISC-V Assembler and Runtime Simulator"
arch=('any')
url="https://github.com/privat/rars"
license=('MIT')
depends=('java-runtime>=11')
provides=('rars')
conflicts=('rars')
origpkgname=rars
source=("https://github.com/privat/rars/releases/download/v$pkgver/$origpkgname-${pkgver}.jar"
        "https://raw.githubusercontent.com/privat/$origpkgname/v$pkgver/src/images/RISC-V.png"
        "https://raw.githubusercontent.com/privat/$origpkgname/v$pkgver/LICENSE"
        "rarsm.sh"
        "rarsm.desktop")
noextract=("$origpkgname-${pkgver}.jar")
sha256sums=('e12060d9683e6cf50efec8900aa9acca2a86838967af8c63f916a66018b884a4'
            '3d2b4769c7935682062f2cc718a1482c098ecf6fbbd2a6781b688047c6085128'
            '2203b1bfbc635b254845fed798e7f35265d15bf1dd276715ff545c239717147b'
            'aebbc3225fece70816eb9c599631f9e14547a29fdfeb7ebbb94d662ba92c3bfe'
            'c04f22f20306c7d3bb92efbd82eb4312a1d7528777d656c4c305ce831989bb90')

package() {
  install -Dm644 "$origpkgname-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm755 rarsm.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 rarsm.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 RISC-V.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
