# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com

pkgname=nodejs-less
pkgver=4.5.1
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
b2sums=('ffc5a03ea93df2ff68f06670ec2e4d05fa14b19cde832023f45caa19276c7b8ab33c991000fcfb1291b523c8e5a47ea4aec38cf1adc05a5c42dcc82584b3ebe1')

package() {
    npm install -g --prefix "$pkgdir"/usr --cache "${srcdir}/npm-cache" "$srcdir"/less-$pkgver.tgz

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

}
