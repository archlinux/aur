pkgname=workbox
pkgver=4.1.1
pkgrel=1
pkgdesc="Utility to help create Progressive Web Apps"
arch=(any)
url="https://developers.google.com/web/tools/workbox/modules/workbox-cli"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/workbox-cli/-/workbox-cli-$pkgver.tgz)
noextract=(workbox-cli-$pkgver.tgz)
sha512sums=(f7a7fa24e45517c51050e3cfbdddcbc00027547ef6c73d129fcd83b83f67dbe4b2a229e46fc1895b51a0b298c897cc159b37e9733b5311db556129468fb1011a)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" workbox-cli@$pkgver
}

# vim:set ts=2 sw=2 et:
