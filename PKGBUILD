# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=eslint-plugin-snakecasejs
pkgname=eslint-plugin-snakecasejs
pkgver='1.2.1'
pkgrel=1
pkgdesc='ESLint Plugin: enforce snake_case syntax on variables and function names'
url='https://github.com/ptkdev/eslint-plugin-snakecasejs'
depends=(
    'nodejs'
    'eslint'
)
makedepends=('npm')
license=('MIT')
arch=('any')
source=('http://registry.npmjs.org/eslint-plugin-snakecasejs/-/eslint-plugin-snakecasejs-1.2.1.tgz')
sha256sums=('00b53b1ea98370c01333fabb5c4499de843a1e4aea90db52749e13b1d3262eae')
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
