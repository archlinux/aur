# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-emoji-blob
_pkgver=2017-05-19
_commit=ca22132c45adb022c1a6c6bed96df76cf0c4fb18
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Google Noto emoji fonts (blob version)"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:OFL)
depends=(fontconfig)
provides=(noto-fonts-emoji)
conflicts=(noto-fonts-emoji)
source=($pkgname-$pkgver.zip::"https://github.com/googlei18n/noto-emoji/archive/$_commit.zip")
sha256sums=('d1d6af8c6606a0b790254b9dd52ae9a2cba85ef7003d7e03430b1634ac7a4877')

package() {
    cd noto-emoji-*
    mkdir -p "$pkgdir"/usr/share/fonts/noto
    install -m644 fonts/*.ttf "$pkgdir"/usr/share/fonts/noto
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
