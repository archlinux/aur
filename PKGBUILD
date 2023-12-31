# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit-bin
pkgver=3.3.1
pkgrel=1
provides=('pwninit')
conflicts=('pwninit')
depends=('elfutils' 'patchelf')
arch=('x86_64')
pkgdesc="Automate starting binary exploit challenges."
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/pwninit"
        "${pkgname}-$pkgver-LICENSE::$url/raw/$pkgver/LICENSE"
        "${pkgname}-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha256sums=('1b72653be59f8f13ea934d1153e8d845eac0dbac62a8c4d9dc4a25577f009362'
            '99dce9273c26ee94572b9fe715d449a300dbcc8d5914285cf3cb31110ca92019'
            'f9aac6864357095d606ec32a8be8771486445f1db267036526cd2304dced38a4')

package() {
  install -Dm 755 "${pkgname}-${pkgver}" -T "${pkgdir}/usr/bin/pwninit"
  install -Dm 644 "${pkgname}-$pkgver-README.md" -T "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname}-$pkgver-LICENSE" -T "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
