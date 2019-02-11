# Maintainer: Adrian Petrescu <apetresc at gmail dot com>

pkgname=rofi-1pass
pkgver=1.0
pkgrel=3
pkgdesc="1Password.com integration for rofi"
arch=('x86_64')
url="https://github.com/apetresc/rofi-1pass"
license=('MIT')
depends=('rofi' '1password-cli' 'pinentry' 'jq' 'xclip')
optdepends=('pinentry-rofi')
source=("${pkgname}::https://github.com/apetresc/rofi-1pass/archive/${pkgver}.tar.gz"
        "rofi-1pass-pinentry.patch")
md5sums=('0c2519abf414b2484c89e7d6b9c61fa3'
         'c8a7e51dd20c5543aaa2cad8cd2968d6')


prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i "${srcdir}/rofi-1pass-pinentry.patch"
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/rofi-1pass" "$pkgdir/usr/bin/rofi-1pass"
}
