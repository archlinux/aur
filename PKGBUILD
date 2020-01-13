# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-react
pkgver=7.17.0
pkgrel=1
pkgdesc='React specific linting rules for ESLint'
arch=('any')
url='https://github.com/yannickcr/eslint-plugin-react'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('e40141e349e7373dfe5b49d9bee19906')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
