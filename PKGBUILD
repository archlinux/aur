# Maintainer: spiritomb <spiritomb on protonmail period com>

pkgname=stylelint-less
pkgver=1.0.6
pkgrel=1
pkgdesc='A collection of Less specific rules for stylelint'
arch=('any')
url='https://github.com/ssivanatarajan/stylelint-less'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=('stylelint: peer dependency')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")


package() {
  npm install -g --prefix "$pkgdir"/usr --cache "$srcdir/npm-cache" --ignore-scripts "${srcdir}/${pkgname}-${pkgver}.tgz"
  #

  rm -rf "$pkgdir"/usr/lib/node_modules/stylelint-less/node_modules/stylelint

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  chown -R root:root "${pkgdir}"
}
sha256sums=('45183342ba9e6ebd3aaf2bff3664d383769901bd071a859b6d016d0397e4f072')
