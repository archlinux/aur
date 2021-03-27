# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=npm-fzf
pkgver=1.1.6
pkgrel=2
pkgdesc="Fuzzy search npm modules with fzf"
arch=(any)
url="https://github.com/hankchanocd/npm-fzf"
license=('MIT')
depends=('nodejs' 'fzf')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}

sha256sums=('2e0c55b4662a3b80fa0d422f995f3ec6e185bafab2f50717a0ebc7f533450df6')
