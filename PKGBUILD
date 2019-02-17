# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_npmname=node-red
_npmver=0.19.5
pkgname=nodejs-${_npmname}
pkgver=${_npmver}
pkgrel=2
pkgdesc="A visual tool for wiring the Internet of Things."
arch=(any)
url="https://nodered.org"
license=(APACHE)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('44545c8f2f76a4cfbfde7e46bdfb94117cba43fee76b2ec5afa0d66d67029e06')

package() {
  mkdir -p ${pkgdir}/usr/lib/node_modules
  cd ${pkgdir}/usr/lib/node_modules
  npm install --global --user root --prefix ${pkgdir}/usr $_npmname@$_npmver
}
