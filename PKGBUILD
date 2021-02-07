# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=7.0.0_beta.1
pkgrel=1
pkgdesc="Spring Boot + Angular/React in one handy generator"
arch=('any')
url="https://www.jhipster.tech/"
license=('APACHE')
depends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz")
noextract=($_npmname-${pkgver//_/-}.tgz)
sha256sums=('defe18f1c0391425f8a9270dd08aec69cd0dc2ec5375efad771e55c69f3dfb59')

package() {
  mkdir -p "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-${pkgver//_/-}.tgz
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}
