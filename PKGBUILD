# Maintainer: Aleksandr Meniailo <deorathemen at gmail dot com>

_npmname=web-shared-folder
pkgname=nodejs-$_npmname
pkgver=4.1.1
pkgrel=1
pkgdesc='HTTP server for sharing files and folders via a web interface'
arch=('any')
url='https://github.com/Mendeo/web-shared-folder'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('64454bbef3a4a92d0e2545b76ad3746a632f2fa37f015d9608e8eb520986caf9')
noextract=("$_npmname-$pkgver.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "$_npmdir/$_npmname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
