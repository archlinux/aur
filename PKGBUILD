# Maintainer: Paolo Viotti <skypixel@gmail.com>

pkgname=sayit
pkgver=1.8
pkgrel=1
pkgdesc="A text-to-speech command line tool backed by Azure Cognitive Services."
arch=('any')
url="https://github.com/pviotti/sayit"
license=('MIT')
depends=('dotnet-runtime>=11.0.0')
source=(https://github.com/pviotti/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver-linux.zip
        $pkgname)
sha256sums=('f35958c108aa06c7efdde381446fcbfa3cd5679668965a710676d20d6cc4b206'
            'fb6b81e833a40374da84e396e8a4b97d40cea9289e1c952d94eac53cbe31e068')

package() {
    install -dm 755 "${pkgdir}/usr/share/$pkgname"
    cp -a "${srcdir}/$pkgname-v$pkgver-linux/." "${pkgdir}/usr/share/$pkgname/"
    install -Dm755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}