# Maintainer: Anton Grensjö <anton@grensjo.se>

_npmname=dat
pkgname=nodejs-$_npmname
pkgver=14.0.3
pkgrel=1
pkgdesc="Sync data across the distributed web"
arch=('any')
url="https://github.com/datproject/dat"
license=('custom')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha1sums=('c9fb949fcd65fdc612b9c0645da70bb201437807')

package() {
    cd "${srcdir}"
    install -D -m644 "package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --global --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" --production $_npmname-$pkgver.tgz
}
