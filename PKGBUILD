# Maintainer: Anton Grensjö <anton@grensjo.se>

_npmname=dat
pkgname=nodejs-$_npmname
pkgver=13.7.0
pkgrel=1
pkgdesc="Sync data across the distributed web"
arch=('any')
url="https://github.com/datproject/dat"
license=('custom')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('604ee7013255286d715b84aea00be609168d915ff1f8b9be63cfd6bccd7d51a0')

package() {
    cd "${srcdir}"
    install -D -m644 "package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --user root --global --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" --production $_npmname-$pkgver.tgz
    rmdir "${pkgdir}/usr/etc"
}
