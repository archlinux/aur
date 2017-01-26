# Maintainer: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-react
pkgver=6.8.0
pkgrel=1
pkgdesc='React specific linting rules for ESLint'
arch=('any')
url='https://github.com/yannickcr/eslint-plugin-react'
license=('MIT')
depends=('nodejs' 'eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('SKIP')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
