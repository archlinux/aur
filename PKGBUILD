# Maintainer: lstnbl <jialanxin1996@hotmail.com>

_npmname=fanyi
pkgname=node-$_npmname
pkgver=5.1.1
pkgrel=1
pkgdesc="A CN and US translate tool in your command line."
arch=('any')
url="https://github.com/afc163/fanyi"
license=('MIT')
depends=('nodejs' 'festival')
makedepends=('npm')
source=(https://github.com/afc163/$_npmname/archive/v$pkgver.tar.gz)
noextract=("v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/v$pkgver.tar.gz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
