# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-import
pkgver=2.14.0
pkgrel=1
pkgdesc='ESLint plugin with rules that help validate proper imports.'
arch=('any')
url='https://github.com/benmosher/eslint-plugin-import'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('3ab00c77854c7889c2bba12c207da798')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
