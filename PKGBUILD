# Maintainer: Amolith <amolith@secluded.site>
pkgname="backblaze-b2-bin"
pkgver=4.4.2
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=('x86_64')
url="https://github.com/Backblaze/B2_Command_Line_Tool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("b2-linux-${pkgver}"::"${url}/releases/download/v${pkgver}/b2-linux"
        "LICENSE"::"${url}/raw/v${pkgver}/LICENSE")
b2sums=('ecf5b08f76c829a41ecac04c960b90218bb7b9cf24295ee3ca5919c02733337c72abca841902b1c382fb8807baf892612e74d611cd81e7dd9c0c504378176f65'
        '23956728ea948c3a425d2bda09099d9d1790c8ff42f329b6736a06d0bbae37f4d414bccadc68672ebc7facae5d74b01d42f302aafa6ed095c41c6513d1f1a40d')

prepare() {
  chmod +x "b2-linux-${pkgver}"
}

package() {
  install -Dm755 "b2-linux-${pkgver}" "$pkgdir/usr/bin/bbb2"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
