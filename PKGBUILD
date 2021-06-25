# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.48.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('d421822abfbbdb6ea9b1dcae198142e7892108c5140652edd903c4019b58d34647332f323b1be331701d7c70159c2768f981f8d7d316de3149846bb0554b03cb')
b2sums=('fedcb433101283afae92c88772babf1728e3476ae959122a308664ef6e2916d00dd7b9f1bdea972e63f8cb0f3c038b4ad4e84b4798386f518a9bc8b9c1da6983')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}

# vim: ts=2 sw=2 et:
