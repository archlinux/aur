# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>

_npmname=js-yaml
pkgname=nodejs-$_npmname
pkgver=4.1.0
pkgrel=1
pkgdesc='YAML 1.2 parser and writer'
arch=('any')
url="https://nodeca.github.io/$_npmname/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
b2sums=('cf2ba9ce80f22562d189f950c1a4f07452984e1dc8619d571b89aa829a425f5962e04b120a875f692eb5cb7144d3b938771fc072f7e774fdd2b8807907610a7d')

package() {
  npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "$pkgdir"/usr "$srcdir/$_npmname-$pkgver.tgz"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/README.md" "$pkgdir/usr/share/doc/$pkgname/"
  ln -s "../../../lib/node_modules/$_npmname/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/"
}
