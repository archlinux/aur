# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com

pkgname=nodejs-less
pkgver=4.0.0
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
sha256sums=('7c6fc7f306101425994d0c6ed6ae6c3e2ddb303769dd0640b3cb4f4ce69d9385')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/less-$pkgver.tgz
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
