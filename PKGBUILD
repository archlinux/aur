# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=remine
pkgver=0.1.6
pkgrel=1
pkgdesc="A simple command line tool for redmine to list and quickly update issues"
arch=(any)
url="https://github.com/schelmo/remine"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=('1c22297d614582da98f03eb2f03e56ad8509294f')

package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$pkgname@$pkgver"
    chown -R root:root "$pkgdir"
    install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

