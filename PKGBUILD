# Maintainer: Paolo Viotti <skypixel@gmail.com>

pkgname=sayit
pkgver=1.1
pkgrel=1
pkgdesc="A text-to-speech command line tool backed by Azure Cognitive Services."
arch=('any')
url="https://github.com/pviotti/sayit"
license=('MIT')
depends=('dotnet-runtime>=3.1.0')
source=(https://github.com/pviotti/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver-linux.zip
        $pkgname)
sha256sums=('2d6c98d8f426795ab16c37da981edc44c8b0cd820710cf699bb2bd9b79ab383a'
            'fb6b81e833a40374da84e396e8a4b97d40cea9289e1c952d94eac53cbe31e068')

package() {
    install -dm 755 "${pkgdir}/usr/share/$pkgname"
    cp -a "${srcdir}/$pkgname-v$pkgver-linux/." "${pkgdir}/usr/share/$pkgname/"
    install -Dm755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
