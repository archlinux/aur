# Maintainer: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=6.7.0
pkgrel=1
pkgdesc="Node version manager"
arch=("any")
depends=("bash")
url="https://github.com/tj/n"
license=("MIT")
install="${pkgname}.install"
source=("https://github.com/tj/n/archive/v$pkgver.zip"
        "LICENSE.md")
md5sums=('b6c0f8fa0bc5953a4e2105ee3d6cad3d'
         '55761bbdb8c6dfe8c83a1f27122bdff1')

package() {
  cd "n-$pkgver"

  PREFIX="$pkgdir/usr" make install

  install -Dm644 "${srcdir}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
