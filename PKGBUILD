# Maintainer: killab33z <killab33z @ protonmail-dot-com>
_npmname=timezones-cli
_npmver=1.1.0
pkgname=nodejs-timezones-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="A cli tool to convert a date or timestamp into different timezones."
arch=(any)
url="https://github.com/alexishevia/timezones-cli"
license=(ISC)
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=(1f9dcac031e2368c3161bee0928f4713516e4ba19377df09a8c31e812202adc9a5887c26067be99664a8eb58d4deead1eca98395b6ff8d6e42e83e532647ea34)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
