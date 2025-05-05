# Maintainer: dreamscached <dreamscache.d@gmail.com>
_pkgname=repomix
pkgname=$_pkgname
pkgver=0.3.3
pkgrel=1
arch=(any)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=(36d294da22c19f72888b3021e6acb183b422317b80ec612e5bfc9b9bcf185151)

package() {
    npm install \
        --global \
        --omit=dev \
        --cache "$srcdir/npm-cache" \
        --prefix "$pkgdir/usr" \
        "$srcdir/$_pkgname-$pkgver.tgz"
}
