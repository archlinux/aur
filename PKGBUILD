# $Id$
# Maintainer: Micha Alt <micha.tucker@gmail.com> 

_npmname=bower-installer
pkgname=nodejs-$_npmname
pkgver=1.3.5
pkgrel=1
pkgdesc='Tool for installing bower dependencies'
arch=('any')
url='https://github.com/rquadling/bower-installer'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        LICENSE)
noextract=($_npmname-$pkgver.tgz)
md5sums=('944c81731d80b5ca1ae3e8c32da86c3f'
         'e0297df41706200a86b9d38b6b5a5904')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr $_npmname@$pkgver
  rm -r "$pkgdir"/usr/etc
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

