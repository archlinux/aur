pkgname=workbox
pkgver=4.3.0
pkgrel=1
pkgdesc="Utility to help create Progressive Web Apps"
arch=(any)
url="https://developers.google.com/web/tools/workbox/modules/workbox-cli"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/workbox-cli/-/workbox-cli-$pkgver.tgz)
noextract=(workbox-cli-$pkgver.tgz)
sha512sums=(29c2c33b4199457a54e0de945ea9daef4b6216e77a02036a698ecf2dae8977e40dbb154861508971b4765d17ab38bbddb0a147a099bf278df8fca1ef5180a6a3)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" workbox-cli@$pkgver
}

# vim:set ts=2 sw=2 et:
