# Maintainer: Paolo Viotti <skypixel@gmail.com>

pkgname=sayit
pkgver=0.3
pkgrel=3
pkgdesc="A text-to-speech command line tool that uses Azure Cognitive Services."
arch=('any')
url="https://github.com/pviotti/sayit"
license=('MIT')
depends=('dotnet-runtime>=3.1.0')
source=(https://github.com/pviotti/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver-linux.zip
        $pkgname)
sha256sums=('b04e5008cf9faad4c0fcefd0ba5b6c3569f6d4776422a01adfa212944f7bf427'
            '13eb0778438f2468ae76f3ea4daf806cbe777ea907513f2c22470cd89a88e7fb')

package() {
    install -dm 755 "${pkgdir}/usr/share/$pkgname"
    cp -a "${srcdir}/$pkgname-v$pkgver-linux/." "${pkgdir}/usr/share/$pkgname/"
    install -Dm755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
