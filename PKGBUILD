# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=4.0.2
pkgrel=1
pkgdesc="JHipster is a fully Open Source, widely used application generator. Easily create high-quality Spring Boot + AngularJS projects!"
arch=('any')
url="https://jhipster.github.io/"
license=('APACHE')
depends=('nodejs-yeoman' 'gulp')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('4a853fcf32cad83f7856aa7c421c588f8f3da4db4422159327dae19c57de2f20')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  cd "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules
  find . -type d -exec chmod 755 {} \;
  rm -r yo
  npm link yo
}

