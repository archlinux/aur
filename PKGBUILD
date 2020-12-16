# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nodejs-less
pkgver=3.12.2
pkgrel=1
pkgdesc="A standalone compiler for the LESS CSS language."
arch=('any')
url="http://lesscss.org/"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
conflicts=('lessc')
provides=("lessc=$pkgver")
replaces=('lessc')
source=("https://registry.npmjs.org/less/-/less-$pkgver.tgz")
sha256sums=('c11a81e671deba197149e5c08ad0762b4b402c37274ced94c0e360c36af91be3')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/less-$pkgver.tgz
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
