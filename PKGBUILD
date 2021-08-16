# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=vicuna-bin
_pkgname=vicuna
pkgver=1.24
pkgrel=1
pkgdesc='Tool for uploading files to Wikimedia Commons and other Wikimedia projects'
arch=('any')
url='https://yarl.github.io/vicuna/'
license=('Apache')
depends=('java-runtime')
provides=('vicuna')
source=(
  "https://github.com/yarl/vicuna/releases/download/$pkgver/$_pkgname-$pkgver.zip"
  "https://github.com/yarl/vicuna/raw/$pkgver/src/main/resources/cuploader/resources/logo.png"
  "vicuna.sh"
  "vicuna.desktop"
)

package() {
  cd "$srcdir"
  install -Dm644 --target-directory "$pkgdir/usr/share/java/$_pkgname/" vicuna/lib/*jar
  install -Dm755 vicuna.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 vicuna.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

sha256sums=('ef05d4a21251e3c143ebbbe09455011d096cd8819510a745538f96c9333d985b'
            '6a9fa5bb5e7ef85b8db08560c7c4460e7ff4c15a9b97a016a10c867ba4ee4725'
            '9d106c19249598401a78ab0ce45a673b3a8a4f99ad98795237dc2111f3d1f8f1'
            'bc6f47e7600117e859c7b7956e28959b03eb5dd8a8eff4318fb4047ecc7cfa42')
