# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_npmname=node-red
_npmver=0.18.7
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
sha256sums=('f5ceabc38811ba84ca8efe8a76c6c8e6405ce1cf0d4f9ca8ad9cbeb905bff2ef')

package() {
  mkdir -p ${pkgdir}/usr/lib/node_modules
  cd ${pkgdir}/usr/lib/node_modules
  npm install --global --user root --prefix ${pkgdir}/usr/lib/node_modules $_npmname@$_npmver
}
