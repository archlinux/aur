# Maintainer: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-import
pkgver=2.2.0
pkgrel=1
pkgdesc='Import with safety (eslint)'
arch=('any')
url='https://github.com/benmosher/eslint-plugin-import'
license=('MIT')
depends=('nodejs' 'eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('7d94b1cd89f2f4eacd01e823d44e3f16')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
