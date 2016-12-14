# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=3.12.1
pkgrel=1
pkgdesc="JHipster is a fully Open Source, widely used application generator. Easily create high-quality Spring Boot + AngularJS projects!"
arch=('any')
url="https://jhipster.github.io/"
license=('APACHE')
depends=('nodejs-yeoman' 'gulp')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$_pkgver.tgz)
sha256sums=('54a61d2d80d3f02310e876034ab453c99c8d79bf9af2f6bdbf96d946181d42e1')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  cd "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules
  rm -r yo
  npm link yo
}

# vim:set ts=2 sw=2 et:
