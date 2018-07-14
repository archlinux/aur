# Maintainer: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>
# Contributor: Mark Harviston infinull@gmail.com
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=jslint
pkgver=0.12.0
pkgrel=1
pkgdesc="Easily use JSLint from the command line."
arch=('any')
url="https://github.com/reid/node-jslint"
license=('custom:BSD and modified MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('095a92eb05af593d00e7a07012b42a49f4b5a202e1f0bec3d3c91a5712cac983')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
