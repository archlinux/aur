_npmname=bower
pkgname=nodejs-$_npmname
pkgver=1.7.1
pkgrel=1
pkgdesc='A package manager for the web'
provides=('bower')
conflicts=('bower')
arch=('any')
url='http://bower.io/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz"
        LICENSE)
noextract=($_npmname-$pkgver.tgz)
md5sums=('06fd72e159d9b4798fa7e7a3afc6888c'
         '135697567327f92e904ef0be2082da5e')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$pkgver
  rm -r "$pkgdir/usr/etc"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

