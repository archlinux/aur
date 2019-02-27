# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_npmname=node-red
_npmver=0.19.6
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
sha256sums=('169190f69c474f1c8cfe2d9f1129be191715875ecae20c7fe6e6c3ee71359df9')

package() {
  mkdir -p ${pkgdir}/usr/lib/node_modules
  cd ${pkgdir}/usr/lib/node_modules
  npm install --global --user root --prefix ${pkgdir}/usr $_npmname@$_npmver
}
