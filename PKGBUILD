# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=7.6.0
pkgrel=1
pkgdesc="Spring Boot + Angular/React in one handy generator"
arch=('any')
url="https://www.jhipster.tech/"
license=('APACHE')
depends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz")
noextract=($_npmname-${pkgver//_/-}.tgz)
sha256sums=('616afd423448ae28fe1a2db3c0d7475681cdf3dc00971217e17156f44228cad0')

package() {
  mkdir -p "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-${pkgver//_/-}.tgz
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}
