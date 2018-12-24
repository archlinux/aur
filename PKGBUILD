# Maintainer: Igor Visi <mail@igorvisi.xyz>

_npmname=verdaccio
_npmver=3.8.5
pkgname=verdaccio
pkgver=3.8.5
pkgrel=1
pkgdesc="Private npm repository server"
arch=(any)
url="https://github.com/verdaccio/verdaccio"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(2478f28b4bf75afc32e59880e75c4e21def917d6)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -Dm644 "$pkgdir"/dropbox.service "$pkgdir"/usr/lib/systemd/user/dropbox.service
  install -Dm644 "$pkgdir"/dropbox@.service "$pkgdir"/usr/lib/systemd/user/dropbox@.service
}

# vim:set ts=2 sw=2 et:
