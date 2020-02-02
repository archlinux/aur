# Maintainer: Anton Grensjö <anton@grensjo.se>

_npmname=dat
pkgname=nodejs-$_npmname
pkgver=13.13.1
pkgrel=1
pkgdesc="Sync data across the distributed web"
arch=('any')
url="https://github.com/datproject/dat"
license=('custom')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('fae1324255783b1033c27a09b916b310da388c9c88e033dcd62002d8191a784f')

package() {
    cd "${srcdir}"
    install -D -m644 "package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --user root --global --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" --production $_npmname-$pkgver.tgz
}
