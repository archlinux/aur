# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=4.14.1
pkgrel=1
pkgdesc="JHipster is a fully Open Source, widely used application generator. Easily create high-quality Spring Boot + AngularJS projects!"
arch=('any')
url="https://jhipster.github.io/"
license=('APACHE')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('a6d80e5c9e5bcbdf4e60e297c745a54025c7aaf9c02ff5e2d9e57ac8c446ff64')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rmdir "$pkgdir"/usr/etc
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}

