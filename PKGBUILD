# Maintainer: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>
# Contributor: Mark Harviston infinull@gmail.com
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=jslint
pkgver=0.12.1
pkgrel=1
pkgdesc="Easily use JSLint from the command line."
arch=('any')
url="https://github.com/reid/node-jslint"
license=('custom:BSD and modified MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('47298dd155e0655f3c30fd30ecae68b06fe45210365e8ecf11b1a8e887f5c280')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
