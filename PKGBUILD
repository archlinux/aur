# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=8.4.0
pkgrel=1
pkgdesc="Spring Boot + Angular/React in one handy generator"
arch=('any')
url="https://www.jhipster.tech/"
license=('APACHE')
depends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz")
noextract=($_npmname-${pkgver//_/-}.tgz)
sha256sums=('5d9ddde6054c9b2c4a55907886fb97c1504b9370679ae00e59f5321c265b967c')

package() {
  mkdir -p "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-${pkgver//_/-}.tgz
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}
