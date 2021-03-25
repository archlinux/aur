# Maintainer: Sumner Evans <inquiries [at] sumnerevans [dot] com>

pkgbase=eslint-plugin-snakecasejs
pkgname=eslint-plugin-snakecasejs
pkgver='2.2.0'
pkgrel=2
pkgdesc='ESLint Plugin: enforce snake_case syntax on variables and function names'
url='https://github.com/ptkdev/eslint-plugin-snakecasejs'
depends=(
    'nodejs'
    'eslint'
)
makedepends=('npm')
license=('MIT')
arch=('any')
source=('http://registry.npmjs.org/eslint-plugin-snakecasejs/-/eslint-plugin-snakecasejs-2.2.0.tgz')
sha256sums=('5961718c3f9d342d46413e32ddc1118fda21607d7e85a3d7cb7b95524bfc832f')
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
