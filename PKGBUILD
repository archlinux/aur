# Maintainer: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=7.0.0
pkgrel=1
pkgdesc="Node version manager"
arch=("any")
depends=("bash")
url="https://github.com/tj/n"
license=("MIT")
install="${pkgname}.install"
source=("https://github.com/tj/n/archive/v$pkgver.zip"
        "LICENSE.md")
md5sums=('8dfd6f54e9608e5e598b2ede1d9e3fa0'
         '55761bbdb8c6dfe8c83a1f27122bdff1')

package() {
  cd "n-$pkgver"

  PREFIX="$pkgdir/usr" make install

  install -Dm644 "${srcdir}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
