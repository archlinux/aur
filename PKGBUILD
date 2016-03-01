# Maintainer: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>
# Contributor: Mark Harviston infinull@gmail.com
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=jslint
pkgver=0.9.6
pkgrel=1
pkgdesc="Command-line JSLint, installed through npm"
arch=('any')
url="https://github.com/reid/node-jslint"
license=('custom:BSD and modified MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/reid/node-jslint/archive/v$pkgver.tar.gz")
sha256sums=("519741839f0a27bdaf41ec8a073c9512db1632d00e64f4ca9d5d02d0eb5ea42f")

package() {
  cd "$srcdir/node-$pkgname-$pkgver"
  mkdir -p $pkgdir/usr
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
}

# vim:set ts=2 sw=2 et:
