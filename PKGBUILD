# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=sleepy-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='Convert OpenAPI 3 specifications into Insomnia, Postman or Bruno collections'
arch=('x86_64')
url='https://github.com/KopyTKG/Sleepy'
license=('BSD-3-Clause')
depends=('glibc')
provides=('sleepy')
conflicts=('sleepy')

_release="$url/releases/download/v$pkgver"
source=("sleepy-$pkgver::$_release/sleepy"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/KopyTKG/Sleepy/v$pkgver/LICENSE")
noextract=("sleepy-$pkgver")
sha256sums=('c4d02e34ca62e0252d3813b542dda5624ff9f245b819c2141f6e496637f72056'
            '765f202dfca30d8f4370bed3870c01b4fb40f7e4070d6cd84e24b250aebf2f69')

package() {
  install -Dm755 "$srcdir/sleepy-$pkgver" "$pkgdir/usr/bin/sleepy"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
