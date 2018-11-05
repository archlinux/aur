# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=cuwire
pkgver=0.5.9
pkgrel=1
pkgdesc='cli tool for microcontroller firmware'
arch=(any)
url='http://apla.github.io/cuwire/'
license=(MIT)
depends=(nodejs gnuplot python)
source=
source=("https://github.com/apla/$pkgname/archive/v/$pkgver.tar.gz")
noextract=($pkgver.tar.gz)
sha512sums=('e975369c24fa04c86d32ab791e1e81ccd40155f6de1d5e5923e5b9ae8820186dc3e8f9a46efba464eb0eb554eda0f3c88a71f0cc98625daf047e0b3448bb3af1')

package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
