# Maintainer: Camren Mumme <camren.mumme@gmail.com>
_npmname=@tgra/cli
_npmnamenoscope=cli
_npmver=1.0.3
pkgname=tegra
pkgver=1.0.3
pkgrel=4
pkgdesc="A command line interface for @tgra/profiler to build Tegra images from a Tegra profile."
arch=(any)
url="https://github.com/cmumme/tegra#readme"
license=(GPL-3.0-only)
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmnamenoscope-$_npmver.tgz)
noextract=($_npmnamenoscope-$_npmver.tgz)
sha1sums=(eab24c85f8d581dcaedca61439b3274b05083652)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}
