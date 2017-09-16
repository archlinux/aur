# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

_npmname=js-yaml
pkgname=nodejs-$_npmname
pkgver=3.10.0
pkgrel=1
pkgdesc='YAML 1.2 parser and writer'
arch=('any')
url="https://nodeca.github.io/$_npmname/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha512sums=('3b6bf9d9f7e32daf5578ce372785e871913ffd64fd374222c036b72921c7ed3bbc0ad1fed6a33c48866f9ec4e1eaffb8c85cb9294637047515c23a5f016b2320')

package() {
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "$pkgdir"/usr "$srcdir/$_npmname-$pkgver.tgz"
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/README.md" "$pkgdir/usr/share/doc/$pkgname/"
  ln -s "../../../lib/node_modules/$_npmname/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/"
}
