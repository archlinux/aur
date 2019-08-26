_npmname=bootlint
_npmver=0.16.6
pkgname=nodejs-bootlint
pkgver=0.16.7
pkgrel=1
pkgdesc="HTML linter for Bootstrap projects"
arch=(any)
url="https://github.com/twbs/bootlint"
license=(MIT)
depends=('nodejs' 'npm' )
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

sha256sums=('552ec1826d059263429b3828d8cb73b8685cf626ebefaa525008e462a254c27e')
