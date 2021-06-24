# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=create-snowpack-app
pkgname=create-snowpack-app
pkgver=1.10.0
pkgrel=1
pkgdesc='Create snowpack apps'
arch=('any')
url='https://github.com/snowpackjs/snowpack/tree/main/create-snowpack-app/cli'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('0883a39a4d41acce3444eb1e36c5c3279f3cbba76926f30a6e364057a1d2a20a')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
}
