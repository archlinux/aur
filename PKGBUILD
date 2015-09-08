# Maintainer: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>
# Contributor: Mark Harviston infinull@gmail.com
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=jslint
pkgver=0.9.3
pkgrel=2
pkgdesc="Command-line JSLint, installed through npm"
arch=('any')
url="https://github.com/reid/node-jslint"
license=('custom:BSD and modified MIT')
depends=('nodejs' 'npm')
source=("https://github.com/reid/node-jslint/archive/v$pkgver.tar.gz")
sha256sums=("740ef493529fc11a4fbe700c54fa05c63881ea23d33fecba0cdab966093a93a4")

package() {
  cd "$srcdir/node-$pkgname-$pkgver"
  mkdir -p $pkgdir/usr
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
