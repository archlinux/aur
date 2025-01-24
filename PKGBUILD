# Maintainer: Dringsim <dringsim@qq.com>
pkgname=tslab
pkgver=1.0.21
pkgrel=2
pkgdesc="Interactive JavaScript and TypeScript programming with Jupyter"
arch=(any)
url="https://github.com/yunabe/tslab"
license=('Apache')
depends=('jupyterlab' 'nodejs')
optdepends=('typescript')
makedepends=('npm' 'patchelf')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('5937851EA2F620C9C7E79585EF7F1A77BCF632E9AA3319EBE055B37A526CB692')
_npmdir="/usr/lib/node_modules/$pkgname"

package() {
  npm install -g --omit=dev --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" "${pkgname}-${pkgver}.tgz"
  "$pkgdir/usr/bin/tslab" install --prefix="$pkgdir/usr"
}
