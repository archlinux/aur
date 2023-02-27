# Maintainer: Funami
# Contributor: Abdelhakim Qbaich <abdelhakim@qbaich.com>

pkgname=rars
pkgver=1.6
pkgrel=1
pkgdesc="RISC-V Assembler and Runtime Simulator"
arch=('any')
url="https://github.com/TheThirdOne/rars"
license=('MIT')
depends=('java-runtime>=8')
source=("https://github.com/TheThirdOne/rars/releases/download/v$pkgver/$pkgname${pkgver//./_}.jar"
        "https://raw.githubusercontent.com/TheThirdOne/$pkgname/v$pkgver/src/images/RISC-V.png"
        "https://raw.githubusercontent.com/TheThirdOne/$pkgname/v$pkgver/License.txt"
        "rars.sh"
        "rars.desktop")
noextract=("$pkgname${pkgver//./_}.jar")
sha256sums=('780f730eb457b1ba609e968accc2c8b77d8f92c3d9dbf30cc7fdb3cfb14e8c24'
            '3d2b4769c7935682062f2cc718a1482c098ecf6fbbd2a6781b688047c6085128'
            'ee3e447d4d5b1f3ed6bc8a71939d06637338fb247777b3e3b60b6202d0712652'
            'ab5b088335e5f189eaffa3399e764d85ad5069bb266a68a5640d2732504c5b56'
            'e380d42d35d37cef1e802ad6fca9fdc7e9e6fbebfe9cc04f57d69536559ae7fb')

package() {
  install -Dm644 "$pkgname${pkgver//./_}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm755 rars.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 rars.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 RISC-V.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
