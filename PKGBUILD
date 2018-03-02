# Maintainer: Anton Grensjö <anton@grensjo.se>

_npmname=dat
pkgname=nodejs-$_npmname
pkgver=13.10.0
pkgrel=1
pkgdesc="Sync data across the distributed web"
arch=('any')
url="https://github.com/datproject/dat"
license=('custom')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('66da3f505c40ce99e09b13a4434c4e420aefe42d023d855f96435b052a23b22c')

package() {
    cd "${srcdir}"
    install -D -m644 "package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --user root --global --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" --production $_npmname-$pkgver.tgz
    rmdir "${pkgdir}/usr/etc"
}
