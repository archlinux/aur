# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Emilien Devos (unixfox) <contact@emiliendevos.be>

_npmname=zone-mta
pkgname=nodejs-zone-mta
pkgver=3.1.0
pkgrel=1
pkgdesc='Modern outbound MTA cross platform and extendable server application'
arch=(any)
url=https://github.com/zone-eu/zone-mta
license=(custom:EUPL)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('669d15d8a36ffcfa4a4747fa656613358be4df4efd5a4921197916c2e6845b08')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
