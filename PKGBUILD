# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=linkinator
pkgver=5.0.1
pkgrel=1
pkgdesc="Find broken links, missing images, etc in your HTML"
arch=(any)
url="https://github.com/JustinBeckwith/linkinator#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('81870d86ffb4db067314bfe88e7882775c19a73252ee029516ba0e6f91c7dfee')
noextract=($pkgname-$pkgver.tgz)
options=(!strip)

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}

