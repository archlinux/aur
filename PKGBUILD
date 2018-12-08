pkgname=workbox
pkgver=3.6.3
pkgrel=1
pkgdesc="Utility to help create Progressive Web Apps"
arch=(any)
url="https://developers.google.com/web/tools/workbox/modules/workbox-cli"
license=('Apache')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/workbox-cli/-/workbox-cli-$pkgver.tgz)
noextract=(workbox-cli-$pkgver.tgz)
sha512sums=(97dece678b069e71f3947b2a1c23ae2b4b36861ece8d94cf84fdf0ea22aacc3f6e47625cb57bd407b801d8c983d348a10f7913c9a47c1cb0a6108dae642ce46f)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" workbox-cli@$pkgver
}

# vim:set ts=2 sw=2 et:
