# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com

pkgname=nodejs-less
pkgver=4.6.7
pkgrel=1
pkgdesc="A standalone compiler for the LESS CSS language."
arch=('any')
url="http://lesscss.org/"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
conflicts=('lessc')
provides=("lessc=$pkgver")
replaces=('lessc')
source=("https://registry.npmjs.org/less/-/less-$pkgver.tgz")
b2sums=('db6f83e9b42a03b200ec4096ebbcd5fa26274c90e4c36434934582806e1cdca8f15b7df2aa0fbd5e33a743556b63094490877a5c3c5f00eaa8a45cf92534f6eb')

package() {
    npm install -g --prefix "$pkgdir"/usr --cache "${srcdir}/npm-cache" "$srcdir"/less-$pkgver.tgz

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

}
