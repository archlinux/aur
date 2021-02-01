# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com

pkgname=nodejs-less
pkgver=4.1.1
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
sha256sums=('1b3b222f91dc2540712e096668b20aaec352c8107009e63d1c2726bc8a6ceff0')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/less-$pkgver.tgz
    chmod -R go-w "$pkgdir"/usr
    chown -R root:root "$pkgdir"/usr
}
