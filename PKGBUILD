# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=4.0.1
pkgrel=1
pkgdesc="JHipster is a fully Open Source, widely used application generator. Easily create high-quality Spring Boot + AngularJS projects!"
arch=('any')
url="https://jhipster.github.io/"
license=('APACHE')
depends=('nodejs-yeoman' 'gulp')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('44cbdc6ab2583d40373b454abaaa8bb717875fa81af69646e29662abe9effb58')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  cd "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules
  find . -type d -exec chmod 755 {} \;
  rm -r yo
  npm link yo
}

