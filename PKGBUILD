# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=7.4.1
pkgrel=1
pkgdesc="Spring Boot + Angular/React in one handy generator"
arch=('any')
url="https://www.jhipster.tech/"
license=('APACHE')
depends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz")
noextract=($_npmname-${pkgver//_/-}.tgz)
sha256sums=('d8fd75c249f887447daa36a7fee36bd70488030efa5e81981b36880767b8de1f')

package() {
  mkdir -p "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-${pkgver//_/-}.tgz
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}
