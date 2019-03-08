pkgname=workbox
pkgver=4.1.0
pkgrel=1
pkgdesc="Utility to help create Progressive Web Apps"
arch=(any)
url="https://developers.google.com/web/tools/workbox/modules/workbox-cli"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/workbox-cli/-/workbox-cli-$pkgver.tgz)
noextract=(workbox-cli-$pkgver.tgz)
sha512sums=(286f4e40b963b3911b3cf40de87fb5b036735ddffe328723ad67b4b883052612acd5ce9d2df412207b2be45a181ed42636ae6bc3c6e3d5f1f65c70129fd378f4)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" workbox-cli@$pkgver
}

# vim:set ts=2 sw=2 et:
