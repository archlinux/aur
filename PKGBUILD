# Maintainer: Adrian Petrescu <apetresc at gmail dot com>

pkgname=rofi-1pass
pkgver=0.2
pkgrel=1
pkgdesc="1Password.com integration for rofi"
arch=('x86_64')
url="https://github.com/apetresc/rofi-1pass"
license=('MIT')
depends=('rofi' 'pinentry')
optdepends=('pinentry-rofi')
source=("${pkgname}::https://github.com/apetresc/rofi-1pass/archive/${pkgver}.tar.gz"
        "rofi-1pass-pinentry.patch")
md5sums=('037a2a0a0c7671153a976aeae34c708b'
         'c8a7e51dd20c5543aaa2cad8cd2968d6')


prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i "${srcdir}/rofi-1pass-pinentry.patch"
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/rofi-1pass" "$pkgdir/usr/bin/rofi-1pass"
}
