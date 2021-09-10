# Maintainer: Anton Grensjö <anton@grensjo.se>

_npmname=dat
pkgname=nodejs-$_npmname
pkgver=14.0.2
pkgrel=1
pkgdesc="Sync data across the distributed web"
arch=('any')
url="https://github.com/datproject/dat"
license=('custom')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('8766e5c4f741ed18885bd361de983166132343bd5d68f96f2e5c8763eac4c686')

package() {
    cd "${srcdir}"
    install -D -m644 "package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --global --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" --production $_npmname-$pkgver.tgz
}
