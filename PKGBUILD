# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

_npmname=js-yaml
pkgname=nodejs-$_npmname
pkgver=3.13.1
pkgrel=1
pkgdesc='YAML 1.2 parser and writer'
arch=('any')
url="https://nodeca.github.io/$_npmname/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha512sums=('61f6dc3bb8d70ddca3d031b16154a549e40d1db0fb5cf5afad559e554ba3ad0128673589211ac23e8ca4ea42fa2008c01b622894c2b84f484d51ed07394b3927')

package() {
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "$pkgdir"/usr "$srcdir/$_npmname-$pkgver.tgz"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/README.md" "$pkgdir/usr/share/doc/$pkgname/"
  ln -s "../../../lib/node_modules/$_npmname/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/"
}
