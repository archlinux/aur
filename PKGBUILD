# Maintainer: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-node
pkgver=4.2.2
pkgrel=1
pkgdesc='Additional eslint rules for node'
arch=('any')
url='https://github.com/mysticatea/eslint-plugin-react'
license=('MIT')
depends=('nodejs' 'eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('8da5ff5a455ad21e32778a909ea6648d')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
