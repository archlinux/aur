# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-node
pkgver=8.0.1
pkgrel=1
pkgdesc='Additional ESLint rules for Node.js'
arch=('any')
url='https://github.com/mysticatea/eslint-plugin-node'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('f85a9a7c2e505f40aeb2e69e13e31881')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
