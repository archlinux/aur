# Maintainer: Paolo Viotti <skypixel@gmail.com>

pkgname=sayit
pkgver=1.6
pkgrel=1
pkgdesc="A text-to-speech command line tool backed by Azure Cognitive Services."
arch=('any')
url="https://github.com/pviotti/sayit"
license=('MIT')
depends=('dotnet-runtime>=9.0.0')
source=(https://github.com/pviotti/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver-linux.zip
        $pkgname)
sha256sums=('1a0115831d50e86d1bc1d6d7a051afb505f7cb6083b70b638cc516ebb2ebb38e'
            'fb6b81e833a40374da84e396e8a4b97d40cea9289e1c952d94eac53cbe31e068')

package() {
    install -dm 755 "${pkgdir}/usr/share/$pkgname"
    cp -a "${srcdir}/$pkgname-v$pkgver-linux/." "${pkgdir}/usr/share/$pkgname/"
    install -Dm755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}