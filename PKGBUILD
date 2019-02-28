pkgname=workbox
pkgver=4.0.0
pkgrel=1
pkgdesc="Utility to help create Progressive Web Apps"
arch=(any)
url="https://developers.google.com/web/tools/workbox/modules/workbox-cli"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/workbox-cli/-/workbox-cli-$pkgver.tgz)
noextract=(workbox-cli-$pkgver.tgz)
sha512sums=(afd7380e72c7201609b7352c1ce2d18aaa3f3a6f77b2d7515299b42aedbfae1c2cdb13f3fd2d2fb87fb528956bb7fff1c25b31833d68ff17d58c22d3cddf5c2b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" workbox-cli@$pkgver
}

# vim:set ts=2 sw=2 et:
