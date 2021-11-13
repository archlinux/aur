# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=linkinator
pkgver=2.16.1
pkgrel=1
pkgdesc="Find broken links, missing images, etc in your HTML"
arch=(any)
url="https://github.com/JustinBeckwith/linkinator#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
options=(!strip)

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}

sha256sums=('22ae4bf765d2d4f0d0f078363c600c19e0ce5ef3701064967cc795445f52af62')
