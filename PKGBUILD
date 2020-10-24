# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit-bin
pkgver=2.2.0
pkgrel=1
provides=('pwninit')
conflicts=('pwninit')
depends=('elfutils')
arch=('x86_64')
pkgdesc="Automate starting binary exploit challenges."
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/pwninit"
        "${pkgname}-$pkgver-LICENSE::$url/raw/$pkgver/LICENSE"
        "${pkgname}-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha256sums=('ac2984416f41790367759bb4c0f2a10653d7b4a31264291f71ab3199a321795e'
            '99dce9273c26ee94572b9fe715d449a300dbcc8d5914285cf3cb31110ca92019'
            '6e41b0da12f548bd88a9fc2493ad6ecf70150f8613f949c9548d9beb0ef91e1b')

package() {
  install -Dm 755 "${pkgname}-${pkgver}" -T "${pkgdir}/usr/bin/pwninit"
  install -Dm 644 "${pkgname}-$pkgver-README.md" -T "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname}-$pkgver-LICENSE" -T "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
