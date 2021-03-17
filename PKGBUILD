# Maintainer: Paolo Viotti <skypixel@gmail.com>

pkgname=sayit
pkgver=1.2
pkgrel=2
pkgdesc="A text-to-speech command line tool backed by Azure Cognitive Services."
arch=('any')
url="https://github.com/pviotti/sayit"
license=('MIT')
depends=('dotnet-runtime>=5.0.0')
source=(https://github.com/pviotti/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver-linux.zip
        $pkgname)
sha256sums=('e781f37340b0cec19d5b939a24010541eb00e2a95e591eb5d5ab1eb1fcf0c5e2'
            'fb6b81e833a40374da84e396e8a4b97d40cea9289e1c952d94eac53cbe31e068')

package() {
    install -dm 755 "${pkgdir}/usr/share/$pkgname"
    cp -a "${srcdir}/$pkgname-v$pkgver-linux/." "${pkgdir}/usr/share/$pkgname/"
    install -Dm755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
