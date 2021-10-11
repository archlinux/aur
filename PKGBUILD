# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=linkinator
pkgver=2.14.4
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

sha256sums=('17c7a18896bf5c2d0feb5793ef22f1af354bf8794f85f9df10c2befe3080d43b')
