# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=sleepy-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Convert OpenAPI 3 specifications into Insomnia, Postman or Bruno collections'
arch=('x86_64')
url='https://gitlab.com/kopytkg/sleepy'
license=('BSD-3-Clause')
depends=('glibc')
provides=('sleepy')
conflicts=('sleepy')

_registry="https://gitlab.com/api/v4/projects/84670021/packages/generic/sleepy"
source=("sleepy-$pkgver::$_registry/v$pkgver/sleepy"
        "LICENSE-$pkgver::$url/-/raw/v$pkgver/LICENSE")
noextract=("sleepy-$pkgver")
sha256sums=('5b39e20d96d941e1dc98b402a53ef08b1a6cdbfb36b68efcf6e8d87cc9170184'
            '765f202dfca30d8f4370bed3870c01b4fb40f7e4070d6cd84e24b250aebf2f69')

package() {
  install -Dm755 "$srcdir/sleepy-$pkgver" "$pkgdir/usr/bin/sleepy"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
