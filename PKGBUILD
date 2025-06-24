# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com

pkgname=nodejs-less
pkgver=4.3.0
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
sha256sums=('8416a3f2eee981847af4dc50c19db2ebf7707d7477f31301d8697537ae88d2a8')

package() {
    npm install -g --prefix "$pkgdir"/usr --cache "${srcdir}/npm-cache" "$srcdir"/less-$pkgver.tgz

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

}
