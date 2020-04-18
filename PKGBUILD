# Maintainer: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=6.5.1
pkgrel=1
pkgdesc="Node version manager"
arch=("any")
depends=("bash")
url="https://github.com/tj/n"
license=("MIT")
install="${pkgname}.install"
source=("https://github.com/tj/n/archive/v$pkgver.zip"
        "LICENSE.md")
md5sums=('b823cc462d676cfd561989b15129c9f6'
         '55761bbdb8c6dfe8c83a1f27122bdff1')

package() {
  cd "n-$pkgver"

  PREFIX="$pkgdir/usr" make install

  install -Dm644 "${srcdir}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
