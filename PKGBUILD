# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_npmname=node-red
_npmver=0.20.6
pkgname=nodejs-${_npmname}
pkgver=${_npmver}
pkgrel=1
pkgdesc="A visual tool for wiring the Internet of Things."
arch=(any)
url="https://nodered.org"
license=(APACHE)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('b9b3d4f8de9875ec7c529b7949c3c79825e057adeb3ae39a241f058a9a8eddce')

package() {
  mkdir -p ${pkgdir}/usr/lib/node_modules
  cd ${pkgdir}/usr/lib/node_modules
  npm install --global --user root --prefix ${pkgdir}/usr $_npmname@$_npmver
}
