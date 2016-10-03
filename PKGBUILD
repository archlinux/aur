# Maintainer: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>
# Contributor: Mark Harviston infinull@gmail.com
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=jslint
pkgver=0.10.3
pkgrel=1
pkgdesc="Command-line JSLint, installed through npm"
arch=('any')
url="https://github.com/reid/node-jslint"
license=('custom:BSD and modified MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/reid/node-jslint/archive/v$pkgver.tar.gz")
sha256sums=("eda186ebf588785fbc0d34bdc6e7eb4eb2df319862866704764f449a60dd8ee8")

package() {
  cd "$srcdir/node-$pkgname-$pkgver"
  mkdir -p $pkgdir/usr
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
}

# vim:set ts=2 sw=2 et:
