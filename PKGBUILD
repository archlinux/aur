# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=godaddy-dns
pkgver=1.2.1
pkgrel=1
pkgdesc="A Node.js script to programmatically update GoDaddy DNS records"
arch=(any)
url="https://github.com/lmammino/godaddy-dns#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --production --global --prefix "$pkgdir/usr" $pkgname@$pkgver
  rmdir "$pkgdir/usr/etc/"

  install -Dm644 "$_npmdir/godaddy-dns/LICENSE" --target-directory="$pkgdir/usr/share/licenses/godaddy-dns"
}

# vim:set ts=2 sw=2 et:
sha256sums=('aff86883a50e02a02b310e62a3331c8a58e74d2868994195be957e4e65004348')
