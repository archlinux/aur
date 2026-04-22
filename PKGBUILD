# Maintainer: iShawyha <shawyhaf@gmail.com>
pkgname=shminer-bin
_pkgname=shminer
pkgver=1.1.4
pkgrel=1
pkgdesc="Mining Client for S-UAH cryptocurrency (Student Hryvnia Miner)"
arch=('x86_64')
url="https://github.com/OlexiyOdarchuk/Student-Hryvnia-Miner"
license=('GPL3') 
depends=('glibc' 'webkit2gtk' 'gtk3' 'cairo' 'pango')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$_pkgname-$pkgver-linux-amd64::https://github.com/OlexiyOdarchuk/Student-Hryvnia-Miner/releases/download/v${pkgver}/SHMiner-linux-amd64"
        "LICENSE::https://raw.githubusercontent.com/OlexiyOdarchuk/Student-Hryvnia-Miner/v${pkgver}/LICENSE"
        "shminer.desktop"
        "icon.png::https://raw.githubusercontent.com/OlexiyOdarchuk/Student-Hryvnia-Miner/main/build/appicon.png") 

sha256sums=('dc10ef98303fde5c101262d7ee4cb6c1a13aaa35d868c01ab80e20e7164067f6'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '1e617e90981872e29d8dff6581a63c456cb4d30178d666406be7af91bbed98bd'
            'e587396876cab3666978caddd2e80ad1a4584e37cc6508d2fd0f0e3c84629d85')

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm644 "$srcdir/shminer.desktop" "$pkgdir/usr/share/applications/shminer.desktop"

  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/shminer.png"
}
