# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=cuwire
pkgver=0.5.6
pkgrel=1
pkgdesc='cli tool for microcontroller firmware'
arch=(any)
url='http://apla.github.io/cuwire/'
license=(MIT)
depends=(nodejs gnuplot python)
source=
source=("https://github.com/apla/$pkgname/archive/v/$pkgver.tar.gz")
noextract=($pkgver.tar.gz)
md5sums=('6b0dd8a58f80501a65e63f0009074147')

package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
